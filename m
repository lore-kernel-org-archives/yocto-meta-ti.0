Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2246E00A08; Fri, 10 Mar 2017 18:54:14 -0800 (PST)
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
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85E57E009B9
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 18:54:11 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2B2rTLL001150;
	Fri, 10 Mar 2017 20:53:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489200810;
	bh=3VWekxpLuk/UmeXyQGm/X3aF4e5TU3micPaYjVCq3n8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=i4w+/JiM2lJDJ7C0NwithyB9DyEeEuEbXaMFVQTeb5Oz545z24IprF5xk89hrEwvC
	3tVVvzK3jMBimOhII92lhWzWYRtj7PhYYVdyHnhSfUv6WrVtsTn5qyL3F2D9kAKUjb
	/s01N2f4jovjP5/rC1zaM1cmmTho6jen6Lh1v3Is=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2B2rO30022758;
	Fri, 10 Mar 2017 20:53:24 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 20:53:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2B2rOvg003851;
	Fri, 10 Mar 2017 20:53:24 -0600
Date: Fri, 10 Mar 2017 21:53:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170311025323.GB578@edge>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell> <20170311014705.GY578@edge>
	<8777103b-9a6f-c1fb-f5ad-f04dc7f44401@gmail.com>
	<20170311022715.GA578@edge>
	<9aaf9e56-7ad8-ede6-600d-eac5879a2c7f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9aaf9e56-7ad8-ede6-600d-eac5879a2c7f@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Gary Thomas <gary@mlbassoc.com>
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
X-List-Received-Date: Sat, 11 Mar 2017 02:54:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 10, 2017 at 06:45:00PM -0800, Khem Raj wrote:
> 
> 
> On 3/10/17 6:27 PM, Denys Dmytriyenko wrote:
> > On Fri, Mar 10, 2017 at 06:00:20PM -0800, Khem Raj wrote:
> >>
> >>
> >> On 3/10/17 5:47 PM, Denys Dmytriyenko wrote:
> >>> On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
> >>>> On 17-03-08 09:10:18, Gary Thomas wrote:
> >>>>> I'm trying to build a [host] SDK for my target which uses some
> >>>>> TI tools, via -c populate_sdk_ext
> >>>
> >>> Gary,
> >>>
> >>> We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the 
> >>> old meta-toolchain mechanism. First, because it can be incorporated into other 
> >>> recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball. 
> >>> Second, it provides more control to what get's packaged into SDK. Third, it 
> >>> doesn't have this undefined magic to packaging stuff - i.e. this post is an 
> >>> example of it failing. And only one slight drawback - requires keeping rootfs 
> >>> image recipe in sync with meta-toolchain SDK recipe...
> >>>
> >>>
> >>>>> In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
> >>>>> I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
> >>>>> I include ti-cgt-pru in my target image to get the tools on my board - that also works.
> >>>>>
> >>>>> The problem is that in my SDK, none of the binaries are included, including clpru:
> >>>>>
> >>>>> $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
> >>>>> total 16
> >>>>> drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
> >>>>> drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
> >>>>>
> >>>>> I added this to try and include the files:
> >>>>>   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
> >>>>> and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
> >>>>> executables included, they just aren't being packaged.
> >>>>>
> >>>>> $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
> >>>>
> >>>> perhaps you need to correct the install location for nativesdk may be
> >>>> via overriding do_install
> >>>
> >>> Why?
> >>
> >> because  /usr/share doesnt look normal place for putting executables.
> > 
> > True in general, but that shouldn't matter. FILES_${PN} lists those and that 
> > should be enough. It appears you are just guessing...
> > 
> > Sidenote:
> > This PRU CodeGen toolchain is kind of weird - it targets PRUs (Programmable 
> > Real-time Units http://elinux.org/Ti_AM33XX_PRUSSv2) and provides binaries in 
> > bin/, headers in include/ and libraries in lib/ directories. Some of the names 
> > collide with system (e.g. libc.a) and hence cannot be installed in standard 
> > locations, thus /usr/share. In fact, many of non-Linux specific components 
> > that deal with specialized cores (i.e. non-general-purpose ARM, such as DSP, 
> > PRU, IPU, numerous Cortex-M accelerators, etc.) are in fact as weird and are 
> > also getting installed in /usr/share to not confuse people and not conflict 
> > with the rest of the system...
> 
> it would be better to have multiple sysroots for all these variants
> would be way simpler and understandable, but why do I care.

Unfortunately, OE doesn't easily support separate sysroots for "secondary" 
processors, besides host and target, like DSP. We had looked into that long 
time ago w/o much success. If you have any suggestions or recommendations, I'm 
all ears!

-- 
Denys

