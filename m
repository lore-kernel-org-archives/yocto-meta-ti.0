Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4478BE0157B
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 21:10:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7C4Al4s018265;
	Sun, 11 Aug 2013 23:10:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7C4AlrS022617;
	Sun, 11 Aug 2013 23:10:47 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 11 Aug 2013 23:10:47 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7C4Al2K006344;
	Sun, 11 Aug 2013 23:10:47 -0500
Date: Mon, 12 Aug 2013 00:10:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ian Geiser <igeiser@devonit.com>
Message-ID: <20130812041047.GC29743@edge>
References: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
	<20130812032959.GA29743@edge>
	<B57A220D1EE1644685BA9AD5C790D20526BEAAD744@SOUTHSIDE.devonintlgroup.com>
MIME-Version: 1.0
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BEAAD744@SOUTHSIDE.devonintlgroup.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] Fix filespath for dylan
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
X-List-Received-Date: Mon, 12 Aug 2013 04:10:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 12, 2013 at 12:03:38AM -0400, Ian Geiser wrote:
> I can fix and resubmit. I found it while porting our 8148 build to Dylan. 
> Thanks!

Actually, never mind, I think I'm wrong on this one - looks like I'm not 
thinking straight at this late hour... :)


> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com]
> > Sent: Sunday, August 11, 2013 11:30 PM
> > To: Ian Geiser
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 1/2] Fix filespath for dylan
> > 
> > On Sun, Aug 11, 2013 at 07:41:34PM -0400, igeiser@devonit.com wrote:
> > > From: Ian Reinhart Geiser <igeiser@devonit.com>
> > >
> > > The old way of setting THISDIR in a bbappend clobbers THISDIR for
> > > other layers.  This change makes it use the new way that is done in
> > > dylan.
> > 
> > Thanks! I've been meaning to fix those for quite some time, but there
> > was always something more important... :)
> > 
> > 
> > > Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
> > > ---
> > >  recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > > index 4b8d0e6..491d403 100644
> > > --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > > +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> > > @@ -1,3 +1,2 @@
> > > -THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> > > -FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> > > -
> > > +PRINC := "${@int(PRINC) + 1}"
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> > 
> > The above should be _append since that is what =. operand does and also
> > since
> > the colon is at the end.
> > 
> > --
> > Denys
> 

