Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBB13E0076B; Thu, 14 Aug 2014 06:50:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 571 seconds by postgrey-1.32 at yocto-www;
	Thu, 14 Aug 2014 06:50:21 PDT
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0669E0074B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 06:50:21 -0700 (PDT)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id D23FE3349B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 15:40:49 +0200 (CEST)
Message-ID: <53ECBC66.4070509@pseudoterminal.org>
Date: Thu, 14 Aug 2014 15:40:54 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Beaglebone Black and libgles-omap3 : build problem
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 13:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a BeagleBone black here, and want to build a rootfs for it with 
Yocto. It shall include support for the SGX GPU.

But when I try to build this, I get:

ERROR: Nothing PROVIDES 'libgles-omap3'
ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
(not in COMPATIBLE_MACHINE)
ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
(not in COMPATIBLE_MACHINE)
ERROR: libgles-omap3-x11 PROVIDES libgles-omap3 but was skipped: 
incompatible with machine beaglebone (not in COMPATIBLE_MACHINE)
ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
(not in COMPATIBLE_MACHINE)

However, this is incorrect. The BeagleBone Black has an AM3359 SoC, 
which does have the SGX, so it is compatible. Looking into the recipe, 
it lists ti33x as being compatible, yet the build breaks. I fixed this 
locally by adding "beaglebone" to the list of compatible machines, but 
of course this is a hack.

Does anybody have some insight into this? Is "beaglebone" perhaps the 
wrong machine for the BeagleBone black? I didn't find any machine config 
called "bblack" or "beagleboneblack" or similar.

cheers

