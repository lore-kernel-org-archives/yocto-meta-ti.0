Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA50DE00305
	for <meta-ti@yoctoproject.org>; Tue,  8 Nov 2011 17:32:32 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUD000BSDLG95G5@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Nov 2011 19:32:05 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 55FC614AF5D; Tue,
	08 Nov 2011 20:32:04 -0500 (EST)
Date: Tue, 08 Nov 2011 20:32:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111109013204.GE15391@denix.org>
References: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
	<CA+M6bXkfk40ztOn+WFocLFGzLRU6PE4z5Qf_9=NAnhO_U4QFSg@mail.gmail.com>
	<CAPOJ94NE2DBeyuW5zqusE-HL4dTxGVvf3U0n0dfnscC0UzF0Sw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAPOJ94NE2DBeyuW5zqusE-HL4dTxGVvf3U0n0dfnscC0UzF0Sw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [oe] forcing dependency on genext2fs-native
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
X-List-Received-Date: Wed, 09 Nov 2011 01:32:35 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, Nov 08, 2011 at 02:00:28PM -0600, Peter Bigot wrote:
> On Tue, Nov 8, 2011 at 1:23 PM, Tom Rini <tom.rini@gmail.com> wrote:
> > On Tue, Nov 8, 2011 at 11:25 AM, Peter Bigot <bigotp@acm.org> wrote:
> >> I've added a DEPENDS += "genext2fs-native" for a recipe in meta-ti,
> >> but the corresponding package is not getting built.  bitbake -DDD
> >> says:
> >>
> >> DEBUG: Added dependency genext2fs-native for
> >> /prj/oe/angstrom/sources/meta-ti/recipes-misc/images/cloud9-gfx-image.bb
> >> DEBUG: providers for genext2fs-native are: ['genext2fs-native']
> >> DEBUG: sorted providers for genext2fs-native are:
> >> ['virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb']
> >> DEBUG: adding virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
> >> to satisfy genext2fs-native
> >>
> >> I'm guessing the "virtual:native:" means somebody thinks genext2fs
> >> should already be installed on the host.  It's not available on
> >> Fedora, so this decision is wrong.  I haven't been able to figure out
> >> what's causing this to happen.
> >
> > No, it means that the "virtual:native" (coming from BBCLASSEXTEND in
> > the recipe file) is being selected to provide "genext2fs-native"
> > (since in many cases we don't have a separate -native recipe, we just
> > use BBCLASSEXTEND).  What's probably happening is that you need
> > genext2fs to exist for a specific task and just "DEPENDS +=
> > genext2fs-native" really means "make do_configure depend on
> > genext2fs-native being in the sysroot".  Did you modify
> > cloud9-gfx-image?  It should already get the DEPENDS right for
> > populating the image.
> 
> The build had failed in meta-ti/classes/sdcard_image.bbclass which
> used genext2fs to build an sdimg image.
> 
> I had added DEPENDS += "genext2fs-native" to
> meta-ti/recipes-misc/images/ti-hw-bringup-image.bb since it was what
> inherited sdcard_image.
> 
> On further investigation cued by your response, it seems that the
> correct change is instead to add:
> 
> IMAGE_DEPENDS_sdimg = "genext2fs-native"
> 
> analogously to what's done for the other image types.  With that the
> bitbake of cloud9-gfx-image does the right thing.

Thanks for your report! Can you please submit a patch to meta-ti mailing list 
at meta-ti@yoctoproject.org
Thanks.

-- 
Denys

