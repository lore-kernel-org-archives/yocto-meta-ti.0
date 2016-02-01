Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1943E0079A; Mon,  1 Feb 2016 13:19:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14EDCE00444
	for <meta-ti@yoctoproject.org>; Mon,  1 Feb 2016 13:19:18 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u11LJI54015525;
	Mon, 1 Feb 2016 15:19:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LJHnP022033;
	Mon, 1 Feb 2016 15:19:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Feb 2016 15:19:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u11LJHE9006538;
	Mon, 1 Feb 2016 15:19:17 -0600
Date: Mon, 1 Feb 2016 16:19:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <winiston@futuraautomation.com>
Message-ID: <20160201211901.GR11314@edge>
References: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
MIME-Version: 1.0
In-Reply-To: <F3717D3DA0F34B72A567796CC4DFB882@RD3>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Problem to write core-image-minimal of AM437x-evm on SD card
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
X-List-Received-Date: Mon, 01 Feb 2016 21:19:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

How about reading some documentation? Since you use Poky, here's a relevant 
part for you to do it manually, just replace am335x and beaglebone with am437x 
and use the respective files you've built:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware#n188

-- 
Denys


On Mon, Feb 01, 2016 at 09:49:48AM +0530, winiston@futuraautomation.com wrote:
> Dear,
> 
> I have successfully built core-minimal image of AM437x-evm using poky. The following files have been created under /tmp/deploy/images/am437x-evm directory.
>   a.. core-image-minimal-am437x-evm.tar.bz2 
>   b.. core-image-minimal-am437x-evm.tar.gz 
>   c.. core-image-minimal-am437x-evm-20160127052452.rootfs.tar.gz 
>   d.. MLO 
>   e.. MLO-am437x-evm 
>   f.. u-boot.img 
>   g.. u-boot-am437x-evm.img 
>   h.. zImage 
>   i.. zImage--4.1.15+git0+b7b07f10f6-r3f-am43x-epos-evm-20160127052452.dtb
> and many more files have been created. I wanted to write it on the sd card. How do I copy the images to sd card? I did not find any command to write the image. Kindly help me out to write the image on sd card. I could not go further to develop my project. I would be very thankful if you give me detail procedure to solve this issue.
> 
> Awaiting your valuable reply. Thanking you.
> 
> 
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
> 
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


