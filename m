Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 956C7E003C1; Mon, 23 Jun 2014 15:33:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B982E0027B
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:33:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5NMXYMQ010599;
	Mon, 23 Jun 2014 17:33:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NMXYru015282;
	Mon, 23 Jun 2014 17:33:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 23 Jun 2014 17:33:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NMXYqB031870;
	Mon, 23 Jun 2014 17:33:34 -0500
Date: Mon, 23 Jun 2014 18:33:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140623223333.GL6700@edge>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
	<1402698848-13759-2-git-send-email-ashcharles@gmail.com>
	<20140623220500.GK6700@edge>
	<CAK8F28mucmU73EWJOWtBpCd60kBhGv97q-Vn0oGNT5U0hsUfxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8F28mucmU73EWJOWtBpCd60kBhGv97q-Vn0oGNT5U0hsUfxw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/6] Set ${TOOLCHAIN_PATH} used by some recipes
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
X-List-Received-Date: Mon, 23 Jun 2014 22:33:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, I set it in our Arago distro based on the toolchain used, but since 
meta-ti is not a distro, I was thinking it should provide a safe default, but 
conditional. In other words, changing your patch to conditional assignment ?= 
should be good enough...

-- 
Denys


On Mon, Jun 23, 2014 at 03:30:10PM -0700, Ash Charles wrote:
> Good point.  Where is the right place to set the toolchain path?  Or
> perhaps the recipes shouldn't use it at all?
> 
> --Ash
> 
> On Mon, Jun 23, 2014 at 3:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > This one is not correct and will break with an external toolchain...
> >
> > On Fri, Jun 13, 2014 at 03:34:04PM -0700, Ash Charles wrote:
> >> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> >> ---
> >>  recipes-ti/includes/ti-paths.inc | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
> >> index 511b5ae..5c9b716 100644
> >> --- a/recipes-ti/includes/ti-paths.inc
> >> +++ b/recipes-ti/includes/ti-paths.inc
> >> @@ -1,5 +1,6 @@
> >>  installdir = "${datadir}/ti"
> >>
> >> +export TOOLCHAIN_PATH = "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
> >>  # This is where do_install will put it
> >>  export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
> >>  export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
> >> --
> >> 1.8.3.2
> >>
> >> --
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti

