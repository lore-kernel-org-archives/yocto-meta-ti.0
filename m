Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3704E00B92; Fri, 12 Oct 2018 14:01:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6B2AE00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 14:01:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9CL1i4o037807;
	Fri, 12 Oct 2018 16:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539378104;
	bh=OgJ3odtN5JEWuG+dQ0v+Qzk1XY066nSyyloA9b0ZCrM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qQOXMT1b+U5YIcWdfP9WFIlKDuP95IGZYBaW2JzrdPRF+YNNISPgza+4aLOgamWa8
	m35gg5zTGWZ9KkGFnECpbhtMfu7XfO3cm6wVl0a05LNIFCmwDvvE30qV7vLu73fglV
	jjSoVlxo4HBKsfgFYlBVBri78BSWLqlcbUVYWL5E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9CL1ilL008458;
	Fri, 12 Oct 2018 16:01:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 12 Oct 2018 16:01:44 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 12 Oct 2018 16:01:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9CL1iiu019229;
	Fri, 12 Oct 2018 16:01:44 -0500
Date: Fri, 12 Oct 2018 17:01:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181012210144.GZ19188@beryl>
References: <20181012195000.4545-1-raj.khem@gmail.com>
	<20181012195801.GV19188@beryl>
	<CAMKF1spE0fJTErUNg=ifQx9s2T-UybjAL++GFwZM+Pyi77pJwg@mail.gmail.com>
	<20181012203149.GW19188@beryl>
	<CAMKF1sqh743UGN0DeWEoR1jX=2NQYGtwh+ONEg+q0MTXkkx3aA@mail.gmail.com>
	<20181012203700.GY19188@beryl>
	<CAMKF1sr48=qWuYYGA4DBbA7Mz+SeOquVfv8iLCWXh66+_pfYQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr48=qWuYYGA4DBbA7Mz+SeOquVfv8iLCWXh66+_pfYQw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
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
X-List-Received-Date: Fri, 12 Oct 2018 21:01:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 12, 2018 at 01:49:05PM -0700, Khem Raj wrote:
> On Fri, Oct 12, 2018 at 1:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Fri, Oct 12, 2018 at 01:34:13PM -0700, Khem Raj wrote:
> > > On Fri, Oct 12, 2018 at 1:31 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > >
> > > > On Fri, Oct 12, 2018 at 01:01:41PM -0700, Khem Raj wrote:
> > > > > On Fri, Oct 12, 2018 at 12:58 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > > >
> > > > > > Are you still trying to do world builds? :)
> > > > > >
> > > > >
> > > > > yes. with the patches I send in this week meta-ti seems to behave in
> > > > > multi-BSP setup
> > > > > I will soon add it to bblayers.conf for Yoe distro and it will start
> > > > > testing on meta-openembedded CI builds, atleast for not nosing other
> > > > > BSPs, I dont have infra to do world build for all the machines
> > > > >
> > > > > but if you were to pick Yoe distro and run with it for machines you
> > > > > are interested in
> > > > > that would be awesome.
> > > > >
> > > > > See. https://github.com/YoeDistro/yoe-distro, everyone having interesting boards
> > > > > is welcome to run world builds using that and report problems.
> > > >
> > > > I can probably add it to my CI loop as well - I already do extensive builds
> > > > and tests on Arago, Poky and distroless.
> > >
> > > Cool thanks. Although you wont need all of above
> > > after this :)
> >
> > Meaning?
> 
> Yoe is a superset

Uhm, hardly. Do you mean just BSP pieces?

