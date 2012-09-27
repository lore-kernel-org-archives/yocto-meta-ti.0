Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2777CE0027E
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:25:00 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8RGOv1r002522;
	Thu, 27 Sep 2012 11:24:57 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8RGOvm0023945;
	Thu, 27 Sep 2012 11:24:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 27 Sep 2012 11:24:57 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8RGOuVN010449;
	Thu, 27 Sep 2012 11:24:56 -0500
Date: Thu, 27 Sep 2012 12:24:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.berlios.de>
Message-ID: <20120927162455.GA7653@edge>
References: <506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 16:25:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2012 at 06:22:42PM +0200, Enrico wrote:
> On Thu, Sep 27, 2012 at 6:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Sep 27, 2012 at 9:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >> I've tried this kernel on a PandaBoard, built with both GCC-4.7.2 (latest
> >> master)
> >> and GCC-4.6.3 (~denzil).  Both fail during to come up.
> >
> > OK you can take further step back and use edison SDK which has gcc 4.5
> > which then can _kind_ of eliminate the compiler if it fails with all 3
> 
> Or take a step forward and try a newer kernel ;)

Well, the current kernel used to work at least on Pandaboard ES...

-- 
Denys

