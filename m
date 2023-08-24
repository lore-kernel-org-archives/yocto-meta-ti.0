Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F2BC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:29:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12364.1692887355414736308
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 07:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bcAz1uL/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37OETEfu056629;
	Thu, 24 Aug 2023 09:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692887354;
	bh=ibJfng1/B26pKol5lsQxluitcZG+Y74+/TT5tZxilRg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bcAz1uL/llQN3s/TUsPbNCu/8EeZFk1/w0Us7eGlEQ5cPiWZC91lGdTxK0D2FV9Bo
	 0gaMLfer2v4j/00XMVs7qOb11vMrBQkjopv/fwSW1308Oi02o3GV+JRYwfjYxtj+2K
	 fh8i1NcP2SVLV3k3+U87BKad4KefhFLEda4/qXbc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37OETEb2067193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Aug 2023 09:29:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Aug 2023 09:29:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Aug 2023 09:29:13 -0500
Received: from [10.250.38.120] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37OETDSf118906;
	Thu, 24 Aug 2023 09:29:13 -0500
Message-ID: <41e1e94c-6efd-0663-129d-b61d682c0f50@ti.com>
Date: Thu, 24 Aug 2023 09:29:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-ti] Setting SERIAL_CONSOLES in machine.conf rather than SoC
 includes
To: Max Krummenacher <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <max.krummenacher@toradex.com>
References: <20230824140848.1981957-1-max.oss.09@gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230824140848.1981957-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Aug 2023 14:29:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16890

On 8/24/23 9:08 AM, Max Krummenacher wrote:
> Hi
> 
> The following two commits do set SERIAL_CONSOLES and
> SERIAL_CONSOLES_CHECK in the the SoC specific am62xx.inc and k3.inc.
> 
> With SysVinit this does spawn a getty on each tty which is specified
> in the variables which also appears in /proc/consoles on the running
> system.
> 
> 31eb1aa2 ("recipes-ti: Add recipe and patches for jailhouse support for am62xx")
> bc894bf5 /"conf: machine: Set common default SERIAL_CONSOLES for all K3")
> 
> Adding whatever tty comes to mind doesn't hurt in a SysVinit system,
> however when configuring OE to use systemd as the init system a
> getty is spawned unconditionally on each listed tty in
> SERIAL_CONSOLES, SERIAL_CONSOLES_CHECK is ignored.

The fix for this we did up in meta-arago using Systemd's getty-generator [0]
which spawns getty only on valid consoles and ignores SERIAL_CONSOLES.
SERIAL_CONSOLES is left here only for SysVinit systems.

I'm guessing you are not using meta-arago (which is fine, ideally meta-ti
should be all you need). In that case, we should find a way to move this
systemd PACKAGECONFIG option setting into meta-ti.

Andrew

[0] https://lists.yoctoproject.org/g/meta-arago/message/14632

> 
> In the light of this, shouldn't bc894bf5 be reverted, i.e. the
> setting of SERIAL_CONSOLES done in the <machine>.conf file and
> 31eb1aa2 have a follow up to move the change to SERIAL_CONSOLES?
> This would help people which do use systemd and include am62xx
> and/or k3 in there <machine>.conf file to not having a getty
> on an arbitrary tty.
> 
> Any thoughts?
> 
> Regards
> Max
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16889): https://lists.yoctoproject.org/g/meta-ti/message/16889
> Mute This Topic: https://lists.yoctoproject.org/mt/100935821/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

