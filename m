Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65E44E00BD2; Mon, 13 Mar 2017 10:05:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7721E00BC8
	for <meta-ti@yoctoproject.org>; Mon, 13 Mar 2017 10:05:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2DH5hQX002689;
	Mon, 13 Mar 2017 12:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489424743;
	bh=hpi3frA72p7VVS5+wSFWptMP3aJ6J88gQ6REbRvfiTM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sMG0AUeUKIjCulcaRHJCoNu/donCGVO2M8iW9JDLzvb2Acx8vtBF106qoW8u7fWEc
	CTdy9JVNXesFbM4LqLWaRdAfRvKUG5tkVsd3s+ccmz46Kw3tIVwsgKNUcdRopgo6mN
	rjx3BLUf8rFetfnrTk3h6nRbAL5mi4NX4n7ScYP4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DH5hGV006229;
	Mon, 13 Mar 2017 12:05:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 12:05:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DH5hkB006696;
	Mon, 13 Mar 2017 12:05:43 -0500
Date: Mon, 13 Mar 2017 13:05:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170313170542.GC578@edge>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell> <20170311014705.GY578@edge>
	<7a87de6c-36a6-2ca0-5a56-1e916b4b0caa@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <7a87de6c-36a6-2ca0-5a56-1e916b4b0caa@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting TI tools into [host] SDK
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
X-List-Received-Date: Mon, 13 Mar 2017 17:05:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Mar 11, 2017 at 06:00:24AM +0100, Gary Thomas wrote:
> On 2017-03-11 02:47, Denys Dmytriyenko wrote:
> >On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
> >>On 17-03-08 09:10:18, Gary Thomas wrote:
> >>>I'm trying to build a [host] SDK for my target which uses some
> >>>TI tools, via -c populate_sdk_ext
> >
> >Gary,
> >
> >We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the
> >old meta-toolchain mechanism. First, because it can be incorporated into other
> >recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball.
> >Second, it provides more control to what get's packaged into SDK. Third, it
> >doesn't have this undefined magic to packaging stuff - i.e. this post is an
> >example of it failing. And only one slight drawback - requires keeping rootfs
> >image recipe in sync with meta-toolchain SDK recipe...
> 
> As I understand, the meta-toolchain style(s) are deprecated.

Seems to still work fine here...


> Also using the populate_sdk_ext gets me many improvements such as 
> relocatable tools and 'devtool'

Yes, this one I can agree with - it's a nice addition to eSDK. But what about 
this one:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/meta/meta-extsdk-toolchain.bb


> >>>In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
> >>>I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
> >>>I include ti-cgt-pru in my target image to get the tools on my board - that also works.
> >>>
> >>>The problem is that in my SDK, none of the binaries are included, including clpru:
> >>>
> >>>$ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
> >>>total 16
> >>>drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
> >>>drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
> >>>
> >>>I added this to try and include the files:
> >>>  TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
> >>>and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
> >>>executables included, they just aren't being packaged.
> >>>
> >>>$ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
> >>
> >>perhaps you need to correct the install location for nativesdk may be
> >>via overriding do_install
> >
> >Why?
> >
> 
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------

