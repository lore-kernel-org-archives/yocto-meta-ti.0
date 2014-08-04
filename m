Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D86CCE004F1; Mon,  4 Aug 2014 09:54:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2CE0E0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:53:50 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 31F7D2DCB; Mon,  4 Aug 2014 18:53:52 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id D8FB37EE;
	Mon,  4 Aug 2014 18:53:51 +0200 (CEST)
Date: Mon, 4 Aug 2014 18:53:43 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Rini <trini@ti.com>
Message-ID: <20140804165343.GS3214@piout.net>
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140804163855.GK19374@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20140804163855.GK19374@bill-the-cat>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Mon, 04 Aug 2014 16:54:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 04/08/2014 at 12:38:55 -0400, Tom Rini wrote :
> On Mon, Aug 04, 2014 at 05:45:50PM +0200, Alexandre Belloni wrote:
> 
> > Using the am335x_boneblack configuration for u-boot allows to save the
> > environment to the emmc. Else, it is not possible to save the
> > environment at all.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> 
> There's two ways to go about improving the out of box experience.  One
> of which would be to switch "beaglebone" to am335x_boneblack config
> which will switch env saving to eMMC and leave BBW just as unable to
> have persisent env (outside of uEnv.txt) as today.  Another would be to
> bring in http://patchwork.ozlabs.org/patch/375824/ (which will be merged
> to mainline) and
> https://git.ti.com/ti-u-boot/ti-u-boot/commit/b8fce957880e6c4194614260f70be4e7f2c9f469
> (which will not, we'll instead get env location migrated to Kconfig
> choices and leave it to the user to pick where they want things to be)
> which puts everything in a binary file on the FAT partition of the SD
> card which is also pretty frequently available.

Do you have a branch with both patches applied? Or maybe it is simpler
to wait for the first one to hit mainline and upgrade the u-boot recipe
at that time.

I'm a bit concerned that the second patch will actually change the
behaviour of the am335x_evm config, switching from reading the env in
nand to that file in the first FAT partition. Do you want to change
that?


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

