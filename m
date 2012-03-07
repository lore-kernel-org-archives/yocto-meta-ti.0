Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E544AE013A2
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 07:28:53 -0800 (PST)
Received: by werm13 with SMTP id m13so4571791wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 07:28:53 -0800 (PST)
Received: by 10.180.24.4 with SMTP id q4mr26947041wif.7.1331134133010;
	Wed, 07 Mar 2012 07:28:53 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fa9sm36639405wib.5.2012.03.07.07.28.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 07:28:51 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CB7CE7A7.75FB0%jdk@ti.com>
Date: Wed, 7 Mar 2012 16:28:49 +0100
Message-Id: <24BE8112-144F-419A-A9A3-39AF457FF0F0@dominion.thruhere.net>
References: <CB7CE7A7.75FB0%jdk@ti.com>
To: Jason Kridner <jdk@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQldpS1TjZyuo8QR8KVdy37gKDXTTK4dqIOT1dWPA3gKGET/Rsjt1LucGFxIhh4AJepydAud
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] gadget init: don't dump info to info.txt on boot
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 15:28:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 7 mrt. 2012, om 16:25 heeft Kridner, Jason het volgende geschreven:

> 
> 
> On 3/7/12 10:22 AM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:
> 
>> 
>> Op 7 mrt. 2012, om 16:20 heeft Jason Kridner het volgende geschreven:
>> 
>>> On Wednesday, March 7, 2012, Koen Kooi wrote:
>>> This script adds ~10s to the boot time, doesn't have error checking and
>>> prevents loading the storage gadget 3 out of 10 times.
>>> 
>>> What is the root cause?  Would it be better to add error checking?
>> 
>> I'm not going to add error checking, so chances are slim it will get
>> fixed in time for the release.
>> 
>>> Remove it from ExecStartPre to get a fast, consistent boot. The
>>> functionality should be moved to bone101.
>>> 
>>> If the drive is already mounted, is it valid to edit this file?  (I
>>> would think not.)
>> 
>> It wouldn't touch the drive, it would show the info on the webpage.
> 
> That makes some sense, but the need to "eject the drive" before this info
> shows up makes me think some people might miss it.  Removing the info.txt
> functionality needs an update to README.htm to stop pointing to it and I
> think it makes sense to switch to the composite MSC+RNDIS+serial gadget
> driver to avoid the need to eject to be able to see this information.

Exactly, the current 3.2.9 kernel should be safe enough to use g_multi on.

regards,

Koen

