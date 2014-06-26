Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EF69E00566; Thu, 26 Jun 2014 16:59:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	T_HDRS_LCASE,T_MANY_HDRS_LCASE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 T_HDRS_LCASE Odd capitalization of message header
	* 0.0 T_MANY_HDRS_LCASE Odd capitalization of multiple message headers
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6118E00282
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 16:59:14 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7S00310VXWX800@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Jun 2014 18:58:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DF8E72018D; Thu,
	26 Jun 2014 19:58:43 -0400 (EDT)
Date: Thu, 26 Jun 2014 19:58:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Cody P Schafer <dev@codyps.com>
Message-id: <20140626235843.GK1580@denix.org>
References: <1403826485-396-1-git-send-email-dev@codyps.com>
MIME-version: 1.0
In-reply-to: <1403826485-396-1-git-send-email-dev@codyps.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] libgles-omap3: add already-stripped to INSANE_SKIP to fix build in poky
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
X-List-Received-Date: Thu, 26 Jun 2014 23:59:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hmm, Poky keeps on turning warnings into errors... Ok, I'll take it.


On Thu, Jun 26, 2014 at 07:48:05PM -0400, Cody P Schafer wrote:
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  recipes-graphics/libgles/libgles-omap3-no-x.inc | 64 ++++++++++----------
>  recipes-graphics/libgles/libgles-omap3-x11.inc  | 44 +++++++-------
>  recipes-graphics/libgles/libgles-omap3.inc      | 78 ++++++++++++-------------
>  3 files changed, 93 insertions(+), 93 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> index 7bb6cfb..13418ad 100644
> --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> @@ -268,38 +268,38 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules"
>  RDEPENDS_${PN} += "fbset devmem2"
>  
>  #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
> -INSANE_SKIP_${PN} = "ldflags dev-so"
> -INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
> -INSANE_SKIP_${PN}-blitwsegl = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es9 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es9 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es9 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es9 = "ldflags"
> -INSANE_SKIP_${PN}-tests = "ldflags"
> +INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es9 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es9 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es9 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es9 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
>  
>  # Quality control is really poor on these SDKs, so hack around the latest madness:
>  FILES_${PN} += "${libdir}/*.so "
> diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
> index 76ef5b3..9aa596a 100644
> --- a/recipes-graphics/libgles/libgles-omap3-x11.inc
> +++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
> @@ -284,28 +284,28 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules-x11"
>  RDEPENDS_${PN} += "fbset devmem2"
>  
>  #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
> -INSANE_SKIP_${PN} = "ldflags dev-so"
> -INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
> -INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es9 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es9 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-tests = "ldflags"
> -INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
> -INSANE_SKIP_${PN}-dev = "ldflags dev-so"
> +INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es9 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es9 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
> +INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-dev = "ldflags dev-so already-stripped"
>  
>  inherit update-rc.d
>  
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> index f417b8e..0b61946 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -352,45 +352,45 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules"
>  RDEPENDS_${PN} += "fbset devmem2"
>  
>  #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
> -INSANE_SKIP_${PN} = "ldflags dev-so"
> -INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
> -INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
> -INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
> -INSANE_SKIP_${PN}-blitwsegl = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
> -INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
> -INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
> -INSANE_SKIP_${PN}-tests = "ldflags"
> -INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
> +INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
> +INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths already-stripped"
> +INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so already-stripped"
> +INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
> +INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags already-stripped"
>  
>  # Quality control is really poor on these SDKs, so hack around the latest madness:
>  FILES_${PN} += "${libdir}/*.so "
> -- 
> 2.0.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

