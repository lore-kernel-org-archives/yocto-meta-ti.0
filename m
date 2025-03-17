Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227D5C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 06:10:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.45837.1742191810722669774
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 Mar 2025 23:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=RAeysio/;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52H6A2wD2699654
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 01:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742191803;
	bh=M5aUOUj4/BGhYGwoCB1tT0QCFbouDo6b/fNSIKECfrg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RAeysio/8QVKzRNyzFTp3qKxU0GkKmHwynw8JCdQbnPSw91b5JqMhF5dWV9YWjmJv
	 2pNK7smfFOvbHJKcjST0RSgyMV3UWDcqXTkbh5vV8bRJ9j/HMG/jS1kTb3rMXQSohI
	 4Eut3pjBmt6qF5b+3klU2GX6D1V/0OR7tvszpUwI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52H6A2EV030855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 01:10:02 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 01:10:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 01:10:02 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52H6A0JY023689;
	Mon, 17 Mar 2025 01:10:01 -0500
Message-ID: <96a6f98f-bf48-4654-96a0-0818a5aca256@ti.com>
Date: Mon, 17 Mar 2025 11:39:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] jailhouse: revert changes for
 am62lxx
To: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <jweyer@aecontrols.com>
References: <20250315014726.2806459-1-denis@denix.org>
 <c195321b-c9d3-4666-8818-83246c9d1fca@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <c195321b-c9d3-4666-8818-83246c9d1fca@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 52H6A2wD2699654
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 06:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18392

Hi Denys and Chirag,

On 15/03/25 19:20, Chirag Shilwant wrote:
> Hi Paresh & Denys,
>
> On 15/03/25 07:17, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> This reverts commit 31b423275aa2bc685a1348218bda16894a35ad8b.
>>
>> This uses an unpublished/uncommitten change - more details:
>> https://lists.yoctoproject.org/g/meta-ti/topic/111318869
>
>
>
> Instead of reverting the entire commit which enabled
> Jailhouse support in AM62L, can't we just update
> the SRCREV to point to a valid commit under ti-jailhouse?
>
> Something that Jared tried to suggest at [0]
>
>
> [0]: https://lists.yoctoproject.org/g/meta-ti/message/18333
>
>

Due to some last min changes, I had to force push which caused the=20
commit to change. Additionally, the commits for Jailhouse branches in=20
meta-ti are usually an older version since Jailhouse updates are done=20
after a RC tag (in meta-tisdk). I can send a patch to correct the commit=20
instead of reverting current changes.


Thanks

> --=20
> Chirag
>
>
>
>> Cc: Paresh Bhagat <p-bhagat@ti.com>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62lxx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc=C2=A0=C2=A0=C2=
=A0 | 10 +++++-----
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 10 +++++-----
>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |=C2=A0 4 =
----
>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc |=C2=A0 5 =
++---
>> =C2=A0 6 files changed, 17 insertions(+), 23 deletions(-)

