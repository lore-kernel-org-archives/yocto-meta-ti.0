Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B6AFE00960; Mon,  1 Jun 2015 08:45:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38D85E0027F
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 08:45:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51FjMmu009014;
	Mon, 1 Jun 2015 10:45:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FjMBM027954;
	Mon, 1 Jun 2015 10:45:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 10:45:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51FjMAD008607;
	Mon, 1 Jun 2015 10:45:22 -0500
Date: Mon, 1 Jun 2015 11:45:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chris Roed <cjroed@mmm.com>
Message-ID: <20150601154521.GN16418@edge>
References: <BN3PR0301MB089913AC4A21E512045A15D4CDC90@BN3PR0301MB0899.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN3PR0301MB089913AC4A21E512045A15D4CDC90@BN3PR0301MB0899.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linux Ti Staging build error
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
X-List-Received-Date: Mon, 01 Jun 2015 15:45:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Unless you were AUTOREV-ing linux-ti-staging recipe, you shouldn't have seen 
this breakage...

On Fri, May 29, 2015 at 03:04:24PM +0000, Chris Roed wrote:
> Hello,
> 
> 
> This is my first time on a linux mailing list.  I'm not sure of proper 
> etiquette, so let me know if I'm being stupid.
> 
> 
> I recently updated my meta-ti to the latest daisy version, and now I'm 
> unable to build the linux-ti-staging kernel.  I've tried completely deleting 
> my tisdk folder and starting from scratch, but I always get this error since 
> I upgraded.  I found this quite odd, as the beaglebone doesn't even have a 
> dra7 processor.  Has anyone seen this?
> 
> 
> 
> 
> |   LD      init/built-in.o
> 
> | drivers/built-in.o: In function `hdmi_i2c2_hack_demux':
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:117: undefined reference to `dra7_mcasp_hdmi_gpio_set'
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:114: undefined reference to `dra7_mcasp_hdmi_gpio_set'
> 
> | drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:71: undefined reference to `dra7_mcasp_hdmi_gpio_get'
> 
> | drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'
> 
> | drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:71: undefined reference to `dra7_mcasp_hdmi_gpio_get'
> 
> | drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'
> 
> | /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'
> 
> | make: *** [vmlinux] Error 1
> 
> | ERROR: oe_runmake failed
> 
> | WARNING: /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/temp/run.do_compileconfigs.21756:1 exit 1 from
> 
> |   exit 1
> 
> | ERROR: Function failed: do_compileconfigs (log file is located at /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/temp/log.do_compileconfigs.21756)
> 
> ERROR: Task 79 (/home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_3.14.bb, do_compileconfigs) failed with exit code '1'
> 
> NOTE: Tasks Summary: Attempted 1293 tasks of which 0 didn't need to be rerun and 1 failed.
> 
> Waiting for 0 running tasks to finish:
> 
> 
> Summary: 1 task failed:
> 
>   /home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_3.14.bb, do_compileconfigs
> 
> Summary: There were 75 WARNING messages shown.
> 
> NOTE: Writing buildhistory
> 
> chris@officelinux12:~/tisdk/build$
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


