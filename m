Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87EA8E00344
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 14:29:02 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8RLStHF019807;
	Thu, 27 Sep 2012 16:28:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8RLStaO029744;
	Thu, 27 Sep 2012 16:28:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 27 Sep 2012 16:28:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8RLStCK011831;
	Thu, 27 Sep 2012 16:28:55 -0500
Date: Thu, 27 Sep 2012 17:28:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20120927212854.GB7653@edge>
References: <EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
	<20120927162455.GA7653@edge> <50647F76.6020109@mlbassoc.com>
	<CAOT3miL737wkzsNdfO38VrYJMf5K57-g3_ZCQji_HV0+y56b3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miL737wkzsNdfO38VrYJMf5K57-g3_ZCQji_HV0+y56b3A@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Sep 2012 21:29:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2012 at 11:15:55PM +0200, Nicolas Dechesne wrote:
> On Thu, Sep 27, 2012 at 6:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> > I build the Panda kernel (based on the latest TI/Ubuntu tree
> > ti-ubuntu-3.4-1485.7 branch)
> > all the time with the Yocto toolchain & it works just fine.
> >
> > I also tried the off-the-shelf 3.1.0 which worked as well.
> >
> > There must be something odd about the 3.1 kernel built from the
> > linux-omap4-3.1.0
> > recipe which is the default when built using Yocto+meta-ti
> 
> i don't think there should be any valid reason to continue with this
> old kernel. first there isn't anyone who maintains that branch (my
> team maintains that evil vendor tree). For Panda I would either
> recommend to use to a more recent branch (like 3.4), in fact we might
> even consider http://git.linaro.org/gitweb?p=landing-teams/working/ti/kernel.git
> (branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
> in fact for Panda, just mainline might be another option too..

Thanks, Nicolas!

I'll give it a try with either of those trees and update the recipe 
accordingly.

-- 
Denys

