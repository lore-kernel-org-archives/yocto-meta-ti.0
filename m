Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D942FE00CF5; Fri, 11 Sep 2015 11:40:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,HEXHASH_WORD,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.4 HEXHASH_WORD Multiple instances of word + hexadecimal hash
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BB85E009B3
	for <meta-ti@yoctoproject.org>; Fri, 11 Sep 2015 11:40:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8BIeDaB025760;
	Fri, 11 Sep 2015 13:40:13 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8BIeD0E011989;
	Fri, 11 Sep 2015 13:40:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Sep 2015 13:43:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8BIeC3n003387;
	Fri, 11 Sep 2015 13:40:12 -0500
Date: Fri, 11 Sep 2015 14:39:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Message-ID: <20150911183957.GP18085@edge>
References: <431866311.1106194.1441962342645.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <431866311.1106194.1441962342645.JavaMail.yahoo@mail.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin | checksum mismatch
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
X-List-Received-Date: Fri, 11 Sep 2015 18:40:21 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Something is wrong on your end, there were no checksum changes:

$ wget http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin
$ md5sum Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin 
94bcb31ea7eb50df1dfa4037055b638e  Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin



On Fri, Sep 11, 2015 at 09:05:42AM +0000, Benjamin Bimmermann wrote:
> Hello,
> I have a checksum mismatch. Have you upgrade to a new Version without change the checksum ?
> Second question : If you have update the omap3, has omap3 now Wayland support and is omap3 now ready for the Kernel 4.1.X ?
> Have a nice day.
> 
> log :
> WARNING: Renaming DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin to DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin_bad-checksum_e71bc0d68048f5f9f17c6ec899e3c9f4
> ERROR: Fetcher failure for URL: 'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin'. Checksum mismatch!
> File: 'DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin' has md5 checksum e71bc0d68048f5f9f17c6ec899e3c9f4 when 94bcb31ea7eb50df1dfa4037055b638e was expected
> File: 'DIR/build_new/downloads/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin' has sha256 checksum e72e1eb512cb66a5390b675a90228a762d026e71fa1bb2f11f235d9198645277 when 54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217e8cdb07 was expected
> If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "e71bc0d68048f5f9f17c6ec899e3c9f4"
> SRC_URI[sha256sum] = "e72e1eb512cb66a5390b675a90228a762d026e71fa1bb2f11f235d9198645277"
> Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
> 
> ERROR: Function failed: Fetcher failure for URL: 'http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/5_01_01_02/exports/Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: DIR/build_new/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_fetch.22324
> ERROR: Task 2918 (DIR/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1146 tasks of which 0 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   DIR/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_fetch
> 

