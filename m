Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 941E9E004DD; Mon,  4 Aug 2014 09:20:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A861AE0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:20:38 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 371E62DCB; Mon,  4 Aug 2014 18:20:40 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id D6FCA803;
	Mon,  4 Aug 2014 18:20:39 +0200 (CEST)
Date: Mon, 4 Aug 2014 18:20:31 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140804162031.GR3214@piout.net>
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CDAEECB9-550D-4013-A3C9-07520AA88C9D@ti.com>
MIME-Version: 1.0
In-Reply-To: <CDAEECB9-550D-4013-A3C9-07520AA88C9D@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Mon, 04 Aug 2014 16:20:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 04/08/2014 at 16:04:04 +0000, Cooper Jr., Franklin wrote :
> How does this config work on the Beaglebone white?
> 

I didn't test but I don't think it will change anything has it doesn't
have any NAND or emmc and the only change is that the am335x_boneblack
uses emmc to save the environment instead of trying (and failing) to
save to NAND.

> > On Aug 4, 2014, at 10:46 AM, "Alexandre Belloni" <alexandre.belloni@free-electrons.com> wrote:
> > 
> > Using the am335x_boneblack configuration for u-boot allows to save the
> > environment to the emmc. Else, it is not possible to save the
> > environment at all.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> > conf/machine/beaglebone.conf | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > index 8a83a1aeb569..0b4dce3ad647 100644
> > --- a/conf/machine/beaglebone.conf
> > +++ b/conf/machine/beaglebone.conf
> > @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
> > 
> > SERIAL_CONSOLE = "115200 ttyO0"
> > 
> > -UBOOT_MACHINE = "am335x_evm_config"
> > +UBOOT_MACHINE = "am335x_boneblack"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

