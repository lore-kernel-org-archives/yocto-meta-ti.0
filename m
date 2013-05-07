Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2A1CE0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 16:06:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47N6brq011466
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 18:06:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47N6b2D017936
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 18:06:37 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 18:06:35 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47N6Zdw026006;
	Tue, 7 May 2013 18:06:35 -0500
Date: Tue, 7 May 2013 19:06:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
Message-ID: <20130507230634.GL12982@edge>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED22D@DFLE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7044ED22D@DFLE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Rini, Tom" <trini@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Tue, 07 May 2013 23:06:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 06:51:00PM -0400, Karicheri, Muralidharan wrote:
> >> > >> See below about pointing SRC_URI to an internal git server.
> >> > >>
> >> > >>
> >> > >> >  BRANCH = "master"
> >> > >> >
> >> > >> > -# DEV.MCSDK-03.00.00.07
> >> > >> > -SRCREV = "82f40e857d853165310d0753e79235aefb65d7ba"
> >> > >>
> >> > >> Please use the format above - it avoid unnecessary breakages when
> >> > >> git-ls-remote is not working...
> >> >
> >> > Adding a commit id means every time we push something to master, I
> >> > need to go and change this. This is not practical. Better point to the
> >> > tip for getting the latest for nightly. What am I missing?
> >> 
> >> The problem is that meta-ti is public and constantly used by many people outside of TI -
> >> every time they parse the recipe, it will hit the server. If you point to arago-project.org, it
> >> may bring it down, as we have seen before.
> >> If you point it to your internal git server, that is not accessible from outside of TI, it will
> >> break parsing for everyone and render meta-ti unusable!
> >> 
> >> See my next comment for details on how to do it in meta-arago instead.
> >> 
> >> 
> >> > >> > +# for nightly switch the two below #SRCREV =
> >> > >> > +"DEV.MCSDK-2013-01.10"
> >> > >> > +SRCREV = "${AUTOREV}"
> >> > >>
> >> > >> Same as before - please no AUTOREVs in meta-ti.
> >> > >>
> >> > >> If you need to track daily/nightly progress from an internal git
> >> > >> server, please use a .bbappend in meta-arago, while keeping meta-ti
> >> > >> pointing to a piblic git server and using a specific commit ID. Let
> >> > >> me know if you need existing examples - we just released Core
> >> > >> TI-SDK 2013.04.00 which used to track the latest linux-ti-staging kernel by setting
> >> AUTOREV in meta-arago.
> >> > >>
> >> >
> >> > I don't know. Please give me an example or help me figure this out.
> >> 
> >> Use something as simple as below, but for the kernel:
> >> http://arago-project.org/git/?p=meta-
> >> arago.git;a=commitdiff;h=32ec5282fd0248581d57ed2a0d66d4c47c275e8c
> 
> Hao,
> 
> Can you make an update for this in meta-arago so that our nightly points to 
> tip of the master or whatever branch?
> 
> Denys,
> 
> So for each of the repos, do we have to use a xxx.bbappend, where xxx is 
> u-boot, boot-monitor and linux-keystone? So I assume the build still uses 
> the meta-ti version of the recipe, but override the SRCREV with whatever set 
> in xxx.bbappend?

Murali,

Correct, .bbappend is the way to "append" changes to the original recipe w/o 
modifying it.

I don't know what you mean by "each of the repos", but yes, you would need to 
place a .bbappend in meta-arago-distro for every component you develop 
actively and for which you don't want to constantly update the recipe with the 
new SRCREV (or BRANCH or SRC_URI etc.)

By keeping meta-ti pointing to a public git tree with a specific SRCREV 
pointing preferably to a release tag or a stable commit ID you are making sure 
that it works for everybody. It is an official TI BSP and is distribution 
agnostic and should be parseable and buildable by anyone out there. On the 
other hand, meta-arago-distro is our own TI distribution and you have more 
freedom there.

-- 
Denys

