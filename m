Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E5B4E00A08; Fri, 10 Mar 2017 17:47:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,LONGWORDS autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  2.0 LONGWORDS Long string of long words
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6E6AE009B9
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 17:47:18 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2B1l6l6011412;
	Fri, 10 Mar 2017 19:47:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489196826;
	bh=FlbKQrg3XsJF/6j175qvCQoydO9Ml/nOKld/gRoGVnU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k1wCj/BFLyZS50OZ1SRZ1Jqtz57gS4MB7OML4n7D4RCAs8cxPyVj4szCpRN1XhUrr
	Mjp9sXUqaNvYNXyy2A5uc4SpGVfP2V/DYI0YxwtbTYnl+ue/Io+LXkNkFyBg9IZjOo
	4xFBekMsf0KIPNqG98AMpgotSoQmFWax+vsV8voo=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2B1l65E002294;
	Fri, 10 Mar 2017 19:47:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 19:47:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2B1l6JJ001189;
	Fri, 10 Mar 2017 19:47:06 -0600
Date: Fri, 10 Mar 2017 20:47:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170311014705.GY578@edge>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell>
MIME-Version: 1.0
In-Reply-To: <20170308170328.GA2586@haswell>
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
X-List-Received-Date: Sat, 11 Mar 2017 01:47:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
> On 17-03-08 09:10:18, Gary Thomas wrote:
> > I'm trying to build a [host] SDK for my target which uses some
> > TI tools, via -c populate_sdk_ext

Gary,

We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the 
old meta-toolchain mechanism. First, because it can be incorporated into other 
recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball. 
Second, it provides more control to what get's packaged into SDK. Third, it 
doesn't have this undefined magic to packaging stuff - i.e. this post is an 
example of it failing. And only one slight drawback - requires keeping rootfs 
image recipe in sync with meta-toolchain SDK recipe...


> > In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
> > I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
> > I include ti-cgt-pru in my target image to get the tools on my board - that also works.
> > 
> > The problem is that in my SDK, none of the binaries are included, including clpru:
> > 
> > $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
> > total 16
> > drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
> > drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
> > 
> > I added this to try and include the files:
> >   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
> > and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
> > executables included, they just aren't being packaged.
> > 
> > $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
> 
> perhaps you need to correct the install location for nativesdk may be
> via overriding do_install

Why?

-- 
Denys


> > abspru    arpru   cgpru     clpru   dispru    hexpru  libinfopru  nmpru   optpru    xrefpru
> > acpiapru  asmpru  clistpru  dempru  embedpru  ilkpru  lnkpru      ofdpru  strippru
> > 
> > Any ideas on what I need to do to get the binary executables into my SDK?
> > 
> > Note: I copied just those (bin) files into my SDK target sysroot usr/bin and the compiler
> > runs just fine.  I just need to figure out the recipe magic to make this happen.


