Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99C6CE00897; Tue, 23 Sep 2014 11:06:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F5EE008A1
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:06:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI60wP009385
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:06:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI60bI017334
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:06:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 13:06:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI60Oa031028;
	Tue, 23 Sep 2014 13:06:00 -0500
Date: Tue, 23 Sep 2014 14:05:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923180559.GT6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-7-git-send-email-a0393906@ti.com>
	<20140923162254.GS6303@edge>
MIME-Version: 1.0
In-Reply-To: <20140923162254.GS6303@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 6/6] libdrm: do_install_append added for modetest
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
X-List-Received-Date: Tue, 23 Sep 2014 18:06:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Doesn't this work?

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/drm/libdrm-2.4.41/installtests-ti.patch#n43


On Tue, Sep 23, 2014 at 12:22:54PM -0400, Denys Dmytriyenko wrote:
> I was pretty sure installtests-ti.patch was supposed to take care of that...
> 
> 
> On Tue, Sep 23, 2014 at 09:30:36PM +0530, Karthik Ramanan wrote:
> > * modetest is a very important application to test the drm
> >   interface, this is not installed by the default make install.
> > 
> > * It is desirable to have this binary on the target because it
> >   allows all kinds of basic debugging.
> > 
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  recipes-graphics/drm/libdrm_2.4.41.bb |    8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
> > index 0150632..d94dca1 100644
> > --- a/recipes-graphics/drm/libdrm_2.4.41.bb
> > +++ b/recipes-graphics/drm/libdrm_2.4.41.bb
> > @@ -15,6 +15,12 @@ SRC_URI += "file://installtests-ti.patch \
> >              file://GNU_SOURCE_definition.patch \
> >             "
> >  
> > -PR = "${INC_PR}.1"
> > +PR = "${INC_PR}.2"
> >  
> >  S = "${WORKDIR}/git"
> > +
> > +do_install_append() {
> > +        mkdir -p ${D}/usr/bin/
> > +        cp ${S}/tests/modetest/.libs/modetest ${D}/usr/bin
> > +}
> > +
> > -- 
> > 1.7.9.5
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

