Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75AA4E0079A; Tue, 12 Aug 2014 08:14:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42D61E006EF
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 08:14:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CFEKXj013842;
	Tue, 12 Aug 2014 10:14:20 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFEKnb021985;
	Tue, 12 Aug 2014 10:14:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 10:14:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFEJgH003649;
	Tue, 12 Aug 2014 10:14:19 -0500
Date: Tue, 12 Aug 2014 11:14:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140812151419.GF23523@edge>
References: <20140812020344.BF28052981@arago-project.org>
	<CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Tue, 12 Aug 2014 15:14:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 12, 2014 at 09:30:22AM -0300, Diego Sueiro wrote:
> Hi there,
> 
> 
> On Mon, Aug 11, 2014 at 11:03 PM, Arago Project git <git@arago-project.org>
> wrote:
> 
> > Module: meta-ti
> > Branch: daisy
> > Commit: 7eeebc0f79d9097e771855d4cfefdb6989be3d05
> > URL:
> > http://arago-project.org/git/meta-ti.git?a=commit;h=7eeebc0f79d9097e771855d4cfefdb6989be3d05
> >
> >
> > Author: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > Date:   Mon Aug  4 21:45:50 2014 +0000
> >
> > beaglebone: use the am335x_boneblack u-boot configuration
> >
> > Using the am335x_boneblack configuration for u-boot allows to save the
> > environment to the emmc. Else, it is not possible to save the
> > environment at all.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> >  conf/machine/beaglebone.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > index 8a83a1a..0b4dce3 100644
> > --- a/conf/machine/beaglebone.conf
> > +++ b/conf/machine/beaglebone.conf
> > @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
> >
> >  SERIAL_CONSOLE = "115200 ttyO0"
> >
> > -UBOOT_MACHINE = "am335x_evm_config"
> > +UBOOT_MACHINE = "am335x_boneblack"
> >
> 
> There is a typo here. Must be "am335x_boneblack_config" instead of
> "am335x_boneblack"

Goot catch, thanks!

-- 
Denys

