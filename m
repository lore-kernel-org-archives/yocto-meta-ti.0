Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07118C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 20:26:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.115079.1671049575656553688
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 12:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=syXPFRJT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BEKQESx082085
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 14:26:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671049574;
	bh=GhYKoQpuKG9tKtTsDmiLPUJyyEy9tMqv3UwfcNKi8tQ=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=syXPFRJTqNdt1V0dpc5tyeHLDK//FTMCYtRUcXxUcNt55EHyuGH6p9AtGuiD5v/x3
	 31ry6ZrqnhlhmB8bbp90eB8qLZpz1q2flXKOrktBA3k1v09qxSIGf+lSqeyPeUf5JD
	 GlEHWcQwgCFj04FEk0926R2Sb3BPkeRk9bAp3VCI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BEKQEEi028016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 14:26:14 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 14
 Dec 2022 14:26:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 14 Dec 2022 14:26:14 -0600
Received: from [10.249.32.159] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BEKQCsR028878;
	Wed, 14 Dec 2022 14:26:12 -0600
Date: Wed, 14 Dec 2022 14:26:07 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
To: Andrew Davis <afd@ti.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Message-ID: <J3EWMR.6Q68HWA4M8303@ti.com>
In-Reply-To: <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
References: <20221206174553.2391187-1-rs@ti.com>
	<18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com> <MY9NMR.KA5B9Y124SPL2@ti.com>
	<b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-q8jZGKmM3gExCCwZbAbb"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 20:26:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15480

--=-q8jZGKmM3gExCCwZbAbb
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com> 
wrote:
> On 12/9/22 4:18 PM, Sapp, Randolph wrote:
>> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com 
>> <mailto:afd@ti.com>> wrote:
>>> Since the UM driver now RDEPENDS on the KM, could we also drop this
>>> last line everywhere?
>> 
>> Nope, we still need the one preferred provider line to indicate that 
>> rogue graphics are present. Now this could be replaced by a 
>> rogue-graphics machine feature instead if that's preferable, but 
>> something will need to signal the mesa switch.
>> 
> 
> New machine feature sounds like the better route since it changes the 
> content of a package.
> Using PREFERRED_PROVIDER for that doesn't seem right.

Fair enough, v4 will roll back to that method.

On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com> 
wrote:
> 
>> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com 
>> <mailto:afd@ti.com>> wrote:
>>> Bash? Are we sure we need that?
>> 
>> Yes. The System V init script still needs it. Now could we look at 
>> removing that init script? Sure, so long as the device probe still 
>> works. What is actually taking care of that right now? It's not udev 
>> is it?
>> 
> 
> The module/device probe is automatic now. At least for SGX that 
> script exists only
> to run the single command "pvrsrvctl --start --no-module" which loads 
> some microcode.
> We can have yocto build that service for us to run the command, IIRC 
> it will make
> it into a systemd or sysv service for us based on what kinda distro 
> we are building.

If that's true rogue can drop it entirely. Updating to do that now.

On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis <afd@ti.com> 
wrote:
> 
>> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com 
>> <mailto:afd@ti.com>> wrote:
>>> "ldflags already-stripped" should be the only skips we still need.
>> 
>> Dev-so is required because of some of the symbolic links that are 
>> shipped. I'm fine dropping arch unless that breaks something.
>> 
>> 
> 
> Ah, think that is /usr/lib/dri/pvr_dri.so, odd name, but yeah that 
> skip can
> stay then. Lets try to drop "arch" at least.

Just found out the MIPS/RISC firmware bin trips the arch check so that 
has to stay.

If you don't mind, take a look at the v3 revision. I'm experimenting 
with using the binary_package class there. Not really sure how I feel 
about it, but it's at least less lines & steps than this revision.


--=-q8jZGKmM3gExCCwZbAbb
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis &lt;afd@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On 12/9/22 4:18 PM, Sapp, Randolph wrote:
<blockquote>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis &lt;<a href="mailto:afd@ti.com">afd@ti.com</a>&gt; wrote:
<blockquote>Since the UM driver now RDEPENDS on the KM, could we also drop this
last line everywhere?
</blockquote>
Nope, we still need the one preferred provider line to indicate that rogue graphics are present. Now this could be replaced by a rogue-graphics machine feature instead if that's preferable, but something will need to signal the mesa switch.

</blockquote>
New machine feature sounds like the better route since it changes the content of a package.
Using PREFERRED_PROVIDER for that doesn't seem right.
</div></blockquote><div><br></div><div>Fair enough, v4 will roll back to that method.</div><div><br></div><div>On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis &lt;afd@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
<blockquote>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis &lt;<a href="mailto:afd@ti.com">afd@ti.com</a>&gt; wrote:
<blockquote>Bash? Are we sure we need that?
</blockquote>
Yes. The System V init script still needs it. Now could we look at removing that init script? Sure, so long as the device probe still works. What is actually taking care of that right now? It's not udev is it?

</blockquote>
The module/device probe is automatic now. At least for SGX that script exists only
to run the single command "pvrsrvctl --start --no-module" which loads some microcode.
We can have yocto build that service for us to run the command, IIRC it will make
it into a systemd or sysv service for us based on what kinda distro we are building.
</div></blockquote><span style="white-space: break-spaces;"><br>If that's true rogue can drop it entirely. Updating to do that now.</span></div><div><span style="white-space: break-spaces;"><br></span></div><div>On Wed, Dec 14 2022 at 12:47:29 -06:00:00, Andrew Davis &lt;afd@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
<blockquote>On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis &lt;<a href="mailto:afd@ti.com">afd@ti.com</a>&gt; wrote:
<blockquote>"ldflags already-stripped" should be the only skips we still need.
</blockquote>
Dev-so is required because of some of the symbolic links that are shipped. I'm fine dropping arch unless that breaks something.


</blockquote>
Ah, think that is /usr/lib/dri/pvr_dri.so, odd name, but yeah that skip can
stay then. Lets try to drop "arch" at least.
</div></blockquote><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">Just found out the MIPS/RISC firmware bin trips the arch check so that has to stay.</span></div><div><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">If you don't mind, take a look at the v3 revision. I'm experimenting with using the binary_package class there. Not really sure how I feel about it, but it's at least less lines &amp; steps than this revision.</span></div></div>
--=-q8jZGKmM3gExCCwZbAbb--

