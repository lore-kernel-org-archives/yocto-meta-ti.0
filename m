Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AFFC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 18:01:06 +0000 (UTC)
Received: from smtp6.emailarray.com (smtp6.emailarray.com [65.39.216.46])
 by mx.groups.io with SMTP id smtpd.web10.14784.1676138465338074366
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 11 Feb 2023 10:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: balister.org, ip: 65.39.216.46, mailfrom: philip@balister.org)
Received: (qmail 34927 invoked by uid 89); 11 Feb 2023 18:01:01 -0000
Received: from unknown (HELO ?192.168.11.155?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3NS43NS45Ni4y) (POLARISLOCAL)  
  by smtp6.emailarray.com with SMTP; 11 Feb 2023 18:01:01 -0000
Message-ID: <ee179ffa-ba74-be38-e519-b12d64e5a3bf@balister.org>
Date: Sat, 11 Feb 2023 13:01:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: meta-ti@lists.yoctoproject.org
From: Philip Balister <philip@balister.org>
Subject: Difference between beaglebone-ai64 and beaglebone-ai64-k3r5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 11 Feb 2023 18:01:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15813

I'm looking at the recent update to meta-ti/kirkstone that appears to
add support for the beaglebone ai64 and I am curious why there are two
machines added. I'm going to see if this works ASAP!

Philip

