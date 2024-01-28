Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC422C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 11:46:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.36039.1706442405738647301
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Jan 2024 03:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=GmZkH/9y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40SBkiDS068021;
	Sun, 28 Jan 2024 05:46:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706442404;
	bh=ODZMvjwoPtSIhsQgaNrdYKczlVlfvtvuzVEXio3maaQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GmZkH/9y0bzN0y3Mh1jRhBQc2PVay7kbMd4GGWZ9LHpKvHtZ4gcZ0c275eHw7d9Uv
	 drm/SFJuMmi/AUXtEm4BOzwjn+Py9LIQiHHsBkPtPqtuir7opOB1vqAsdsj7tsyl9t
	 kKxTDDjOATe0MyB3DxPEnMnFfN7ux1n4Z9Lx50iM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40SBkiN4014488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 28 Jan 2024 05:46:44 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 28
 Jan 2024 05:46:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 28 Jan 2024 05:46:43 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40SBkftm039398;
	Sun, 28 Jan 2024 05:46:42 -0600
Message-ID: <8a0aa5d1-cedc-4541-b023-1603bd242c0c@ti.com>
Date: Sun, 28 Jan 2024 17:16:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master][PATCH] Revert "python3-yamllint:
 Temporarily carry this new recipe"
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240126192526.15795-1-reatmon@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240126192526.15795-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 40SBkiDS068021
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 28 Jan 2024 11:46:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17423


On 27/01/24 00:55, Ryan Eatmon via lists.yoctoproject.org wrote:
> This reverts commit 04c2204c11cb3ee5eee84f2d213037b763954786. oe-core=20
> master branch picked up this patch [1], so we no longer need it in=20
> meta-ti. [1]=20
> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//git.=E2=80=
=8Aopenembedded.=E2=80=8Aorg/openembedded-core/commit/?id=3D128cfc5222752=
a6337a9cbb9bc9023c13ee19f2f__;!!G3vK!XgvfybGwc6e4N18jPzO0DkGffqB5uxx8A9Nv=
alQ9VwVs8kdvcXHXZOntXxpRasmIwLWq3kope5pRZSgWjnkmF09p6nTeAlZP6A$
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> This reverts commit 04c2204c11cb3ee5eee84f2d213037b763954786.
>
> oe-core master branch picked up this patch [1], so we no longer need it
> in meta-ti.
>
> [1]https://urldefense.com/v3/__https://git.openembedded.org/openembedde=
d-core/commit/?id=3D128cfc5222752a6337a9cbb9bc9023c13ee19f2f__;!!G3vK!Xgv=
fybGwc6e4N18jPzO0DkGffqB5uxx8A9NvalQ9VwVs8kdvcXHXZOntXxpRasmIwLWq3kope5pR=
ZSgWjnkmF09p6nTeAlZP6A$
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 --------------=
-
>   1 file changed, 15 deletions(-)
>   delete mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/py=
thon3-yamllint_1.33.0.bb
>
> diff --git a/meta-ti-extras/recipes-devtools/python-yamllint/python3-ya=
mllint_1.33.0.bb b/meta-ti-extras/recipes-devtools/python-yamllint/python=
3-yamllint_1.33.0.bb
> deleted file mode 100644
> index 4b7bd065..00000000
> --- a/meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_=
1.33.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY =3D "A linter for YAML files."
> -HOMEPAGE =3D "https://urldefense.com/v3/__https://github.com/adrienver=
ge/yamllint__;!!G3vK!XgvfybGwc6e4N18jPzO0DkGffqB5uxx8A9NvalQ9VwVs8kdvcXHX=
ZOntXxpRasmIwLWq3kope5pRZSgWjnkmF09p6nRPUSLbJw$"
> -LICENSE =3D "GPL-3.0-only"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e4=
40464"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE =3D "yamllint"
> -
> -SRC_URI[sha256sum] =3D "2dceab9ef2d99518a2fcf4ffc964d44250ac4459be1ba3=
ca315118e4a1a81f7d"
> -
> -DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS:${PN} +=3D "${PYTHON_PN}-pyyaml"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17422): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17422__;!!G3vK!XgvfybGwc6e4N18jPzO0DkGf=
fqB5uxx8A9NvalQ9VwVs8kdvcXHXZOntXxpRasmIwLWq3kope5pRZSgWjnkmF09p6nQSaKXBR=
A$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/103983388/7030289__;!!G3vK!XgvfybGwc6e4N18jPzO0DkGffqB5uxx8A9Nval=
Q9VwVs8kdvcXHXZOntXxpRasmIwLWq3kope5pRZSgWjnkmF09p6nRDzjxx_g$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy__;!!G3vK!XgvfybGwc6e4N=
18jPzO0DkGffqB5uxx8A9NvalQ9VwVs8kdvcXHXZOntXxpRasmIwLWq3kope5pRZSgWjnkmF0=
9p6nTs3UsRuA$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

