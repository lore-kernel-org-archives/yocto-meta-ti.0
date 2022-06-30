Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F90C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 13:33:01 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.25313.1656595974914101007
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 06:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=lFgGAVLP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UDWquW073473;
	Thu, 30 Jun 2022 08:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656595972;
	bh=3Cx+p4xFS1BYnKw0da3KwW7/TKXDB7sckm3OYyxTLfg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=lFgGAVLPKazgYvfUqRC3dMi4c0BjJPb9LGd6ZHv1tkYoVP/fzRD8FtyfkucXFrwSU
	 DwmyJClvFhaKOqVLu/n2hWxs0WItGqoc7/r7R4w/G/4hulPOEry5SpFAoOiVT2+SVO
	 6YdvTdAv8pPTp62sflXRDLGfM39ny8lzVQyVnAxA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UDWqHH041238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 08:32:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 08:32:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 08:32:52 -0500
Received: from [10.250.33.129] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UDWpq2106899;
	Thu, 30 Jun 2022 08:32:52 -0500
Message-ID: <2556b609-47c0-8202-ca03-5bb82a7c968c@ti.com>
Date: Thu, 30 Jun 2022 08:32:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH] linux-ti-staging: Unblock SA2UL for
 AM64x and J7200 HS devices
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220628204514.5159-1-afd@ti.com>
 <dff23446-248d-eb06-06f5-a0862d7aa368@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <dff23446-248d-eb06-06f5-a0862d7aa368@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id
 25UDWquW073473
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 13:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14853

On 6/30/22 5:08 AM, Bajjuri, Praneeth wrote:
> Andrew,
>=20
> assuming this is applicable for master branch as well.
>=20

I'd think so yes, I've been a bit time crunched lately so not been
testing these against master. Plan was to go back later and check
all my patches that didn't get synced to master and resend as needed.

Andrew

> On 6/29/2022 2:15 AM, Andrew Davis via lists.yoctoproject.org wrote:
>> The SA2UL driver now works on HS devices, unblock this.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>=20
> Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
>=20
>> ---
>> =C2=A0 recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ------
>> =C2=A0 1 file changed, 6 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-k=
ernel/linux/linux-ti-staging_5.10.bb
>> index 75ffa904..59094a9e 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
>> @@ -45,9 +45,3 @@ module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r=
5_remoteproc pre: virtio_rpmsg
>> =C2=A0 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remotep=
roc pre: virtio_rpmsg_bus"
>> =C2=A0 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remo=
teproc ti_k3_dsp_remoteproc"
>> =C2=A0 KERNEL_MODULE_AUTOLOAD_append_j7 =3D " rpmsg_kdrv_switch"
>> -
>> -# Disable SA2UL for AM64x HS and J7200 HS
>> -module_conf_sa2ul_am64xx-hs-evm =3D "blacklist sa2ul"
>> -KERNEL_MODULE_PROBECONF_append_am64xx-hs-evm =3D " sa2ul"
>> -module_conf_sa2ul_j7200-hs-evm =3D "blacklist sa2ul"
>> -KERNEL_MODULE_PROBECONF_append_j7200-hs-evm =3D " sa2ul"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#14846): https://lists.yoctoproject.org/g/meta-ti/m=
essage/14846
>> Mute This Topic: https://lists.yoctoproject.org/mt/92052612/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@=
ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

