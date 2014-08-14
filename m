Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 566C6E007DD; Thu, 14 Aug 2014 07:03:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 815A1E007D9
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 07:03:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7EE3Wax003095;
	Thu, 14 Aug 2014 09:03:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EE3Wob002227;
	Thu, 14 Aug 2014 09:03:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 09:03:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7EE3Vpd008647;
	Thu, 14 Aug 2014 09:03:32 -0500
Date: Thu, 14 Aug 2014 10:03:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140814140331.GW23523@edge>
References: <53ECBC66.4070509@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <53ECBC66.4070509@pseudoterminal.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Beaglebone Black and libgles-omap3 : build problem
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
X-List-Received-Date: Thu, 14 Aug 2014 14:03:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Don't use beaglebone machine from meta-yocto-bsp, but instead use beaglebone 
machine from meta-ti, if you want to use other components from meta-ti...

-- 
Denys


On Thu, Aug 14, 2014 at 03:40:54PM +0200, Carlos Rafael Giani wrote:
> Hello,
> 
> I have a BeagleBone black here, and want to build a rootfs for it
> with Yocto. It shall include support for the SGX GPU.
> 
> But when I try to build this, I get:
> 
> ERROR: Nothing PROVIDES 'libgles-omap3'
> ERROR: libgles-omap3 was skipped: incompatible with machine
> beaglebone (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3 was skipped: incompatible with machine
> beaglebone (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3-x11 PROVIDES libgles-omap3 but was skipped:
> incompatible with machine beaglebone (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3 was skipped: incompatible with machine
> beaglebone (not in COMPATIBLE_MACHINE)
> 
> However, this is incorrect. The BeagleBone Black has an AM3359 SoC,
> which does have the SGX, so it is compatible. Looking into the
> recipe, it lists ti33x as being compatible, yet the build breaks. I
> fixed this locally by adding "beaglebone" to the list of compatible
> machines, but of course this is a hack.
> 
> Does anybody have some insight into this? Is "beaglebone" perhaps
> the wrong machine for the BeagleBone black? I didn't find any
> machine config called "bblack" or "beagleboneblack" or similar.
> 
> cheers
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

