Return-Path: <matthias.schnelte@de.abb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DE9C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 17:17:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.74])
 by mx.groups.io with SMTP id smtpd.web11.14897.1685985449909305995
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 10:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.abb.com header.s=selector1 header.b=e7aW+bTO;
 spf=pass (domain: de.abb.com, ip: 40.107.105.74, mailfrom: matthias.schnelte@de.abb.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDh/FRvZgNa0qKWAvSvhfoyGlEYlp9/vz/WRcGxMv/MV6lcVI4RhL0F2zulzfKLzA9q8zw9lDZBaqP6kLg1sRhE2YJ7tQKDNgCrfPfD7kOEaFY6eMeo6uzR4KON3o+LaQHZhYCZtaiMyNmrTzJQiqrdkEYa5TEq/iq9qiatroF2cxxGbVR1yv3eoMr9+ODY5hWl1dij2ZDyhoPk4beRxwnxInnsV0SYKoz/WPLj0X1dprIMeY2V/6lylyjK4dk6F3kjTgPGBV4wYvLKvVkK/yPxnl85kIxvyKfGMV9+FnR67zlCAvODus97odYxN8lqX97/RxYR8ay/YDOBieJiVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZFB6tQ/FQcdXQ6qu7nHvFXtU3+yrI9W0pf/ZIndSMo=;
 b=Yk3rFPlMMMxT1GY7N+5F0XgVy61mSp1hHM0lDM8R+g643tYtOOVl2HWc8ZofFYhTjXZibcU596Zru6hWqWuxBBXdoJ5p6LFWZMWCWCSt/09yoNJVDGe07YV8HhBV+pIDZSHnSWEtzlU1dPu3uQdof1gvjD6mFThhxSmf6Im3Qcpxu6Vus6elVKhVn8vgHM+2JoWRorqHyJ3b2h12+/sz69TrhaFc2ra21KRBdqW7WCNeAeyojBaNp0Bvlz6387uFSVHV1LWC4oEhvYQNm0ntmF2P5cucTQ5XBrf2RempvijOCGQJkdsDDs1XAOXRJMpargcJvdZICGJTXhufbjzkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.abb.com; dmarc=pass action=none header.from=de.abb.com;
 dkim=pass header.d=de.abb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.abb.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZFB6tQ/FQcdXQ6qu7nHvFXtU3+yrI9W0pf/ZIndSMo=;
 b=e7aW+bTOCcL81+0PQtgsUQNqH4mHejTA7/NJud7Xyd9Pv/zkyUosEJa6RXVPWxTRt321tDsM4nWjJk3GNGsQ3lZa6pk2YTtZIiLNzkJzQ3BSEd65++yCr6aeET+boxY3enJQ6wqId0Y6Qhb6cW00xMPOwHvCi5WcEiz4cMsK3S/XKXZIto4uCIHq/m1C8lam8yWTnbLGM6yuu0Cxx7PBysBZgjq5CK9YR6OYYjEgeRE1O+amIQ5WoEly7oa0hD5OqYfiyxrDZYu8Jy6tKXYJ92AiQBqEMCV/PtwADPx3zzu7wbHkhOdnLjvTMhqq/TUMXVN0KautjCuhkMiGlDf9AQ==
Received: from DB9PR06MB8106.eurprd06.prod.outlook.com (2603:10a6:10:26b::7)
 by AS8PR06MB7429.eurprd06.prod.outlook.com (2603:10a6:20b:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:17:27 +0000
Received: from DB9PR06MB8106.eurprd06.prod.outlook.com
 ([fe80::4142:2164:bed2:4ddd]) by DB9PR06MB8106.eurprd06.prod.outlook.com
 ([fe80::4142:2164:bed2:4ddd%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:17:27 +0000
From: Matthias Schnelte <matthias.schnelte@de.abb.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Mesa for SGX on kirkstone
Thread-Topic: Mesa for SGX on kirkstone
Thread-Index: AQHZl9Exdv9cSQz9CUO5jRSGNCc7Ow==
Date: Mon, 5 Jun 2023 17:17:27 +0000
Message-ID: 
 <DB9PR06MB8106872E258ACB1F859619DCC44DA@DB9PR06MB8106.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.abb.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB8106:EE_|AS8PR06MB7429:EE_
x-ms-office365-filtering-correlation-id: 4abdb876-9373-4ad1-a4da-08db65e8bc8b
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QwPtP4shc24xYx0zyM89/TQiupAekPGHrdAbIDHgF6xl2i1KtQ6JurD17fJ8fVmaLf773sawHJ0OUJRh8HFJc7Cu0YicqupmZhRgULBI6QFOZk+Ecn0qTh0LoLEnM9x/9UfwNR8xfmhj+wv0xdcrEKHcORLppCyfbcKu7uvAshKAu/1qHwoGScZmLdKi9jl3mPvkxh+DFRTHAhNoxwfYJQ64YXWKz34Eh5I0KWZL6oVkgYhMmsZPaVe9+kSE/JPFidTfoX+kISmRLprjJjGQp6RAXkL5RUPU1cnXxR7Km9RdBPbkIaCSywrwKavfYnd/5YM0F6xb2vHgH3X7Ea4H+8BS3P7vJRFtdelkQcUj7kcdrt5gFfK4A18GCcVHPNK3wsKuYL7++hvj7yOfYGu01swtLsn0yVoZ5X+WkRUYi3jFZUoaCVVJXC6tE5qEXJjJtBZNWtre8QRZ6qXWAEgl6ABP/jrDs5/FuVhBNsNhZ75tm32H5zXAlT29eJplORfdG3TpKZ9oUe5dde2WVjLb+zv48px+0pqVypA83fvCF5yLRy7YJVLnIWq7SZ9aL9nfDStKj9AMVnZBYGNHVZewy7PbHmvZ0jc2oyR6uOkYfCwcMzVeI7kaWat8Q+anOYTn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8106.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(9686003)(26005)(66946007)(66446008)(6506007)(44832011)(316002)(6916009)(66556008)(122000001)(91956017)(76116006)(64756008)(66476007)(7696005)(186003)(38070700005)(478600001)(33656002)(71200400001)(2906002)(5660300002)(8936002)(8676002)(55016003)(82960400001)(86362001)(52536014)(41300700001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EY2jTITwWxCWLzwv5UG5PFInn4C7NJeQInFHXcyP5JOGvTMoobQZM4y57R?=
 =?iso-8859-1?Q?WKHeW/JEWN4X0uqesf6kbIGhbsz6OK60o3m4OZy6RsxDNIeAMhhmXKEVqB?=
 =?iso-8859-1?Q?9WtRO2C8WcFfB23H6ozPh7MuekuwIoWn0MZEMb/bkqauL8K20MaqzmH2qZ?=
 =?iso-8859-1?Q?aCrJ+rSRDk4zg2t4bytCFYVjUYzZnOhTin8FSwzqNHSuzm/+fdcoTjE4Jm?=
 =?iso-8859-1?Q?4AfATzXGqIPN2n3KUd/rmzYJs+kIZcsN8gdX+Hdzb8aico67CQbR4ZlxtA?=
 =?iso-8859-1?Q?2seQYZqwcpny9e/eO8O/yl+Pm+/mvcMjIA5Xn89zLoz4EjTIqPXZ4V8ERR?=
 =?iso-8859-1?Q?fPLvR64WWApYyhXLqSPARn4miCf7/mXlU5JSiqM+4QN44v1Qj/s8wXZi5v?=
 =?iso-8859-1?Q?B9tRlt0mi5I+XydK+M1bahEa9Ob6MXo2MnM4GdKA17o8mriW7Le4fXt1xL?=
 =?iso-8859-1?Q?BpmL+qGtnkVWAnxpuDiguPildSuuQHvIZd6NvzGycWin/RNcrhBaCeXz+D?=
 =?iso-8859-1?Q?FRtIdo3qhSzWcxYZM94FhSULp/LonMqPgxqfbGOrIttSUhTcuo0Y/8mSzU?=
 =?iso-8859-1?Q?OonAp/vwh6NICaYpvoznGE2P+4JDx+nqbZKGqtI7G5Y424b8WQuRuaK+CU?=
 =?iso-8859-1?Q?/t/JuAUne+FBOgw451XG4+EMr/TXsnreMVS6eLEDuvOLqTjalXoHhpi0CV?=
 =?iso-8859-1?Q?3Iyboqxan8mMi5r+EeTYOrN5KBZxDixBSAkB6m+5NIHmDIwVDJARg7jrEM?=
 =?iso-8859-1?Q?MHDoRFyIoWbGk9cuiIpayRnlYOEFzb+MBY8FDjuOiKqMyYmvcyG7Nfu2e0?=
 =?iso-8859-1?Q?gugxLLIJA/GyTm+XDzwrqYeRX9cvFxSMX1UvmMlXcQnNnjobkdOzJqDn0b?=
 =?iso-8859-1?Q?CNxD9UvdJGPylb9IT9JtXXp0dorI0Qy0X2TSVoB3kuZOkZpNbORPNBgf7E?=
 =?iso-8859-1?Q?Bnu13o4oJJH1zEfIbP5cSw45dryWWPI+olkQxrSqjAMn1GupZZ6Ty2D6NU?=
 =?iso-8859-1?Q?mvQKSE65+wNkBGhQmLwYEiWL8UsbOZtY6l5Ck6o5MqU72+xUM47I/VM+iO?=
 =?iso-8859-1?Q?1IDF0aFoY6xO5LYhLJCU3iXf8UjzIf7rQKHzZ5y+HnqAATnq0Jl5H2WCpJ?=
 =?iso-8859-1?Q?jKggBc0bXIYFQ537F+Lkh/ChCXn16l+Yy1mAIRNvXbGuqXsU/ygSJziHCX?=
 =?iso-8859-1?Q?tLFhVYc1nonewKE8lsAF+1pU/pPnX7ZpHQ3xWRnKQ4zqwo7fO1rAdEwJUr?=
 =?iso-8859-1?Q?MTVTkE/jlSyFkl/2xKETSdJ4KIuV0JeCA6azs0loRp9smcP16Zj+ILuVSN?=
 =?iso-8859-1?Q?qGGFe8WcyMOdk802ajAvtmZbk2xHIaCUWtctVy67T7AtEaz17+RoIW//fS?=
 =?iso-8859-1?Q?+OdvkLYy2ZplYkosIULUrYPrl9byG3pzYt4kF4XUjt1eCgYt75l7wFtSPB?=
 =?iso-8859-1?Q?YkLp92iqnljhk8re3io6U5gQy8RMgbjKahtWP8yF5NZ6TUnCS7eq5+V/Dk?=
 =?iso-8859-1?Q?O3hr/ZEd0UpPkZwBN3vwM/KwjGzvDImfNiC9ZUGDUYgAK96Vj3FQp23+21?=
 =?iso-8859-1?Q?jyqWhdUnTdxL160utY3UbET1nGfCiqZPOW7DkS45W8v/iprFtiyVZzNpMp?=
 =?iso-8859-1?Q?JSsL6MV/0STaQkUemzzxkCsZMgp/0lQV1iW0TQpYtpBA3fisW/1ZJZmw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.abb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8106.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abdb876-9373-4ad1-a4da-08db65e8bc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 17:17:27.3005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpyI6HOHjAoKdqltsJARpUs9Z/HwbjgTO87meIH0jD6Xw+4L9hzEIPHNBtwu65jOM8Y/d7+bZdesBd9lyDvBIZd1zvaOogbwiKEli8Rg3Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7429
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 17:17:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16667

Hello everyone,=0A=
=0A=
I was trying to build kirkstone for am335x with a SGX GPU.=0A=
I was not able to use it with mesa.=0A=
=0A=
On the latest kirkstone (1743b0101) (I tried it with the latest master, too=
) if I set =0A=
=0A=
PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"=0A=
=0A=
bitbaking mesa-pvr fails with =0A=
=0A=
../git/meson.build:21:0: ERROR: Options "sgx" are not in allowed choices: "=
auto, kmsro, radeonsi, r300, r600, nouveau, freedreno, swrast, v3d, vc4, et=
naviv, tegra, i915, svga, virgl, panfrost, iris, lima, zink, d3d12, asahi, =
crocus, pvr"=0A=
=0A=
=0A=
There is a branch wip2/kirkstone/sgx-1.17-4948957/22.0 on the mesa-pvr repo=
sitory that includes this option. But this branch fails to build with lots =
of undefined reference errors.=0A=
=0A=
So the only way to build an image with working SGX support for me was to po=
rt the ti-sgx-ddk-um_1.17.4948957.bb from dunfell over to kirkstone and set=
 preffered providers for my target as in dunfell.=0A=
=0A=
PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"=0A=
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"=0A=
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"=0A=
PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"=0A=
PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"=0A=
=0A=
Is this currently the only way to get SGX working or am I doing sth wrong?=
=0A=
=0A=
Tnx.=0A=
=0A=
Matthias=

