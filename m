Return-Path: <r-monk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37474E00303
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 16:45:11 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q110j6NA024353;
	Tue, 31 Jan 2012 18:45:06 -0600
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q110j6q1012179;
	Tue, 31 Jan 2012 18:45:06 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Wed, 1 Feb 2012 01:45:05 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: "Peter A. Bigot" <bigotp@acm.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related to
	installer
Thread-Index: AQHM4BWlBQMuPZ03BUqE4nTWvC7OfJYnM8bg
Date: Wed, 1 Feb 2012 00:45:03 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
In-Reply-To: <1328013657-2069-1-git-send-email-bigotp@acm.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.64.7]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Resubmit TI DSP build issues related to	installer
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
X-List-Received-Date: Wed, 01 Feb 2012 00:45:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:
> Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related to
> installer
>
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> This patch set re-submits the (updated) uncommitted parts of my
> 27Dec2011 patch set to get gstreamer-ti and its dependencies to build
> in a pristine work environment.  It was left back on 29Dec2011 with:
>
> > I'm going to wait for Roger to get back from holidays to comment on
> the installer issues, I'll push the CE and dmai patches later today.
>

Thanks for re-basing/re-submitting - sorry this has taken a while.  Your pa=
tches look good - however, I have some other failing installer scenarios li=
ke these for which I have a similar, but unfortunately, not the same patchs=
et, in progress.  I hope to review yours in the coming days if ok.

> The installer issues are:
>
> ti-eula-unpack spawns the installer, then writes canned input to it to
> do things like set the output directory.  The function that does this
> explicitly tacks a second newline on, in addition to the one normally
> added by Python's print statement.
>
> For ti-cgt6x, the result is that a bare newline is fed to the
> installer at the point where the installation directory is requested,
> instead of the workdir.  Hence, the default directory gets used; for
> this package, that's in /opt/TI.
>
> For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also
> caused the default installation directory to be requested, but for
> this package that's ${HOME}/ti.  Since ti-eula-unpack overrides the
> HOME environment variable to be the work directory, everything somehow
> happened to work out, at least for other folks.  I don't think that's
> a great solution though, so I updated the recipes to do it "right", by
> changing the commands to conform to what the current installers expect.
> There may be other installation recipes for other tools that need the
> same fixes.
>
> For the 31Jan2012 attempt, similar changes had to be made to
> ti-codecs- omap3530.
>
> For the 31Jan2012 attempt, the ti-dmai build required more than just
> altering the striplevel: the ${S} value had to be changed since there
> was no Makefile at its original value.  There is still an issue that
> prevents use of where make 3.85 produces a "Entering an unknown
> directory" failure in do_install, but that's an upstream problem: I
> just used make 3.81 to complete the build.
>
> Peter A. Bigot (4):
>   ti-eula-unpack: remove extraneous newline in cmd output
>   various: fix installation directories for corrected ti-eula-unpack
>   ti-codecs-omap3530: fix for corrected ti-eula-unpack
>   ti-dmai_svn: correct path within svn checkout
>
>  recipes-ti/bios/ti-dspbios.inc                     |    3 ++-
>  .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20 ++++++++++--
> --------
>  recipes-ti/devtools/ti-xdctools.inc                |    3 ++-
>  recipes-ti/dmai/ti-dmai_svn.bb                     |    9 ++++++---
>  recipes-ti/edma3lld/ti-edma3lld.inc                |    3 ++-
>  recipes-ti/includes/ti-eula-unpack.inc             |    2 +-
>  6 files changed, 23 insertions(+), 17 deletions(-)
>
> --
> 1.7.6.4
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti




