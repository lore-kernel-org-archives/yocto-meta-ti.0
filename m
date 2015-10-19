Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6574E0049B; Mon, 19 Oct 2015 15:29:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DC94E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 15:29:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JMSx3c026432;
	Mon, 19 Oct 2015 17:28:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JMSxQZ022790;
	Mon, 19 Oct 2015 17:28:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 17:28:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JMSwKo009427;
	Mon, 19 Oct 2015 17:28:59 -0500
Date: Mon, 19 Oct 2015 18:28:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20151019222843.GL5620@edge>
References: <20151013190042.GA8031@bang.betafive.co.uk>
MIME-Version: 1.0
In-Reply-To: <20151013190042.GA8031@bang.betafive.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: linux-ti-staging: Error during parsing
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
X-List-Received-Date: Mon, 19 Oct 2015 22:29:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2015 at 08:00:42PM +0100, Paul Barker wrote:
> Hi,
> 
> I'm trying to move from dylan forward to fido and ran into a parsing error with
> the linux-ti-staging recipe (all versions in the tree). Here's a run through of
> what I've done on a Centos 7 host with relevant output included. I'm using the
> coresdk-2015.01 tag but there aren't any commits on the fido branch after this.
> 
> $ git clone http://arago-project.org/git/projects/oe-layersetup.git
> 
> $ cd oe-layersetup/
> 
> $ ./oe-layertool-setup.sh -f configs/coresdk/coresdk-2015.01-config.txt
> 
> $ cd build/
> 
> $ . conf/setenv
> 
> $ MACHINE=k2hk-evm bitbake core-image-minimal
> NOTE: Started PRServer with DBfile: /home/COMMAGILITY/paul.barker/tmp/oe-layersetup/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 37851, PID: 8637
> NOTE: Your conf/bblayers.conf has been automatically updated.
> ERROR: ExpansionError during parsing /home/COMMAGILITY/paul.barker/tmp/oe-layersetup/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_4.1.bb: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception Fet
> chError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.

Hi, Paul,

Quick question - what do you use for a toolchain? By default, coresdk config 
you reference above expects pre-built Linaro toolchain (tested with 2015.05) 
in your PATH. While it is supposed to give a meaningful error message when it 
can't find the expected toolchain, sometimes I've seen it fail and give 
absolutely cryptic one instead. Can you please grab the following tarball, 
extract it and add it's bin/ dir to your PATH and try again? Thanks.

http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz

BTW, meta-arago allows you to control the toolchain with TOOLCHAIN_TYPE and 
TOOLCHAIN_BRAND variables, defaulting to "external" and "linaro"...

-- 
Denys


> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> $ MACHINE=k2hk-evm bitbake -e linux-ti-staging | grep SRC_URI
> #     [doc] "URL to source mirror that will be used before fetching from original SRC_URI."
> # $SRC_URI_OVERRIDES_PACKAGE_ARCH
> #     [doc] "By default, the OpenEmbedded build system automatically detects whether SRC_URI contains files that are machine-specific. If so, the build system automatically changes PACKAGE_ARCH. Setting this variable to '0' disables this behavior."
> # $SRC_URI [5 operations]
> SRC_URI="             file://configs  file://cmem.dtsi git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.1.y             file://defconfig"
>     # using the same syntax as for SRC_URI. If the variable is not set
>     src_uri = (d.getVar('SRC_URI', True) or "").split()
>         src_uri = localdata.getVar("SRC_URI", True).strip() or "None"
>     src_uri = (d.getVar('SRC_URI', True) or "").split()
>         # any others should be covered by SRC_URI.
>     fetcher = bb.fetch.Fetch(d.getVar('SRC_URI', True).split(), d)
>     # Copy the data object and override DL_DIR and SRC_URI
>         localdata.setVar('SRC_URI', srcuri)
>     src_uri = (d.getVar('SRC_URI', True) or "").split()
>     srcuri = d.getVar("SRC_URI", True).split()
>         # Copy the data object and override DL_DIR and SRC_URI
>             localdata.setVar('SRC_URI', srcuri)
>     src_uri = (d.getVar('SRC_URI', True) or "").split()
> 
> To my understanding the SRCREV_FORMAT variable needs to be set when SRC_URI
> contains multiple git repositories to pull from. In this case it looks like it's
> just one repository in SRC_URI. I'm not really sure how to debug this further,
> there aren't any logs to look at as the error is during parsing.
> 
> I can successfully build core-image-minimal for MACHINE=k2hk-evm if I remove the
> linux-ti-staging recipes. However it'd be good to get a build to work with
> unmatched sources.
> 
> Any ideas for how to look into this further?
> 
> Cheers,
> 
> -- 
> Paul Barker
> 
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk



