Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8548BE009A0; Mon, 26 Jun 2017 11:53:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E571E0048B
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 11:53:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QIrIkd019943;
	Mon, 26 Jun 2017 13:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498503198;
	bh=t7zS5WX+yjSmK37PNN2RprXOvdlBaaixUko3TWP3nT8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vjVaKdDOkXuSloEugieIH5c1Pnm2PW81ntliOemQTBDvO3skSkvzFRUGcpuOmJNtg
	/ldYLjW0YKV2IVQTs2bntLsjwzqywao30/cUgIXNb2FBe37jm2zFOPeG4OL+bYbAli
	lAYE7FRn6nB+mHBczA8m2HabBcdqlHU/dCSh1jQA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIrI84009253;
	Mon, 26 Jun 2017 13:53:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 13:53:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QIrIFE007689;
	Mon, 26 Jun 2017 13:53:18 -0500
Date: Mon, 26 Jun 2017 14:53:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Kenny Koller <kenny@understoryweather.com>
Message-ID: <20170626185315.GF14665@edge>
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: install cannot stat u-boot.img (Pyro)
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
X-List-Received-Date: Mon, 26 Jun 2017 18:53:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Do you use meta-ti layer?


On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
> Hi,
> 
> I'm using 2.3 to build the minimal Beaglebone Black images.
> 
> I issue the following and get the error below. Is the warning regarding a
> missing bootloader config the issue?
> 
> Thanks,
> 
> Kenny
> 
> $ bitbake core-image-minimal
> 
> | INFO: Creating image(s)...
> |
> | WARNING: bootloader config not specified, using defaults
> |
> | ERROR: _exec_cmd: install -m 0644 -D
> /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img
> /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170624014756/tmp.wic.khxryxga/boot/u-boot.img
> returned '1' instead of 0
> | output: install: cannot stat
> '/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img': No
> such file or directory
> |
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_image_wic (log file is located at
> /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
> ERROR: Task
> (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_wic)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need to be
> rerun and 1 failed.
> 
> Summary: 1 task failed:
>   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:
> do_image_wic
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


