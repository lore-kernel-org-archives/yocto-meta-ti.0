Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14E60E011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:30:23 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q77FUInC015020;
	Tue, 7 Aug 2012 10:30:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q77FUIoC019614;
	Tue, 7 Aug 2012 10:30:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 7 Aug 2012 10:30:18 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q77FUHWX022151;
	Tue, 7 Aug 2012 10:30:17 -0500
Date: Tue, 7 Aug 2012 11:30:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20120807153016.GA8716@edge>
References: <5020D9A0.30000@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5020D9A0.30000@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 15:30:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from
> meta-ti. I am using the poky distro configuration and I have changed
> the defconfig in
> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> but it still builds with CONFIG_SPI_DEBUG enabled.

That should be the correct location, please make sure you re-do the unpack 
task - if you previously built the kernel with the old defconfig, it will be 
stored in the work directory and won't be copied from the repository above, 
until you repeat the do_unpack task, i.e. by clenaing the build.


> Do the meta-ti kernels support BSP config fragments like the yocto
> kernels or is there a better way to do this?

No, we are not yet supporting config fragments from linux-yocto, although it's 
on my Todo list...

-- 
Denys

