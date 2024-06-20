Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD1FC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:52:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.52811.1718902352729994108
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 09:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=diINcbS2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KGqWwB089822
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718902352;
	bh=NgoqDFasFNXvEYmfk3lyqwHrq6xNmr1cZESgWxFuZsk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=diINcbS247zDwQa1WSFZAyCYx7y3xDFs8ikfz1Nq/fhXDwKQHKEz6q3phUQCCxNDf
	 rXxpR0ax/HsjjHSmSqLXwVzyaSSKu4xRK0H9qZrfEZxUroGTu8rAcnFywfzeytehww
	 XlhMKQr2wUGO2myXXGaXIXk7aUvPYM2+DX+xU+pw=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KGqVN9076867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:52:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 11:52:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 11:52:31 -0500
Received: from [128.247.83.254] (lt5cd302htfz.dhcp.ti.com [128.247.83.254])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KGqVG1051524;
	Thu, 20 Jun 2024 11:52:31 -0500
Message-ID: <cd72a089-e370-4b4f-aa77-f6b41a891d5c@ti.com>
Date: Thu, 20 Jun 2024 11:52:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 3/4] cc33xx-fw: install
 cc33xx firmware
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-4-sabeeh-khan@ti.com>
 <54010fc4-9d05-41f8-83a4-15204192238d@ti.com>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <54010fc4-9d05-41f8-83a4-15204192238d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 45KGqWwB089822
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 16:52:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17778


On 6/20/2024 11:33 AM, Ryan Eatmon wrote:
>
>
> On 6/19/2024 10:22 PM, Sabeeh Khan via lists.yoctoproject.org wrote:
>> Download and install the cc33xx firmware and binaries
>> to be used with the cc33xx drivers.
>>
>> FW Version: 1.7.0.120
>>
>> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
>> ---
>> =C2=A0 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb=C2=A0=C2=A0=C2=A0 | =
26 +++++++++++++++++++
>> =C2=A0 1 file changed, 26 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>>
>> diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb=20
>> b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>> new file mode 100644
>> index 00000000..152e3501
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION =3D "Firmware files for use with TI cc33xx"
>> +LICENSE =3D "TI-TSPA"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENCE;md5=3Ddf68504cbd0a4da1643ebcfd5783dbc9"
>> +
>> +SRC_URI =3D " \
>> +=20
>> git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=3Dhttps;branch=
=3D${BRANCH}
>> +"
>
> These patches are not consistent.
>
> This one does a multi line SRC_URI and adds the BRANCH variable. Can=20
> we redo the patches to be consistent in style?=C2=A0 Either use BRANCH =
in=20
> all, or don't use BRANCH.=C2=A0 And make all of the SRC_URI and single =
line.
>
Hi Ryan, thanks for the review.

Yes, I have no issue in changing this and will ensure the SRC_URI/BRANCH=20
variable are consistent.


