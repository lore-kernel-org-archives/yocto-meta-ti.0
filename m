Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C108E0076C; Thu, 25 Sep 2014 09:49:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74E0AE0074B
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:49:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8PGmw4I016160;
	Thu, 25 Sep 2014 11:48:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8PGmwKT015875;
	Thu, 25 Sep 2014 11:48:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 25 Sep 2014 11:48:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8PGmwVL014027;
	Thu, 25 Sep 2014 11:48:58 -0500
Date: Thu, 25 Sep 2014 12:48:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.sourceforge.net>
Message-ID: <20140925164857.GB6303@edge>
References: <CAF+2n7Tr+tqEq_R2cr0SuUQ8+PDB5tQKeCW2GLr=RW+-W35o_Q@mail.gmail.com>
	<CA+2YH7t7PVNKA6xT1QcCgGoPY_foe020_sxWk5dJYhmLqi8QYA@mail.gmail.com>
	<CAF+2n7QzdBhtZxJ6oi11KaUovc2PiWpN=Q4gBBm28tMjm3efXw@mail.gmail.com>
	<CA+2YH7uaRmXepsmmYXQQ8_UXzsOBnwo1QPxnCSf=xqU1s04Cew@mail.gmail.com>
	<CAF+2n7SGhcgMgD0AXoQb1=WV+P=ZiP9UEYe8RfOr+VxmhUAZuQ@mail.gmail.com>
	<CA+2YH7t1ET1YK3-0LqmL65S954CJAb4ACeKKpw=PPnzvCBtOBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+2YH7t1ET1YK3-0LqmL65S954CJAb4ACeKKpw=PPnzvCBtOBw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Video encoding on OMAP4430
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
X-List-Received-Date: Thu, 25 Sep 2014 16:49:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

There are some pieces of accelerated multimedia with gstreamer in 
meta-arago-extras:

http://arago-project.org/git/?p=meta-arago.git;a=tree;f=meta-arago-extras/recipes-multimedia;hb=HEAD

Although, those are currently being used for OMAP5 and derived parts, so 
compatibility with OMAP4 is not guaranteed. If you are adventurous enough, you 
are welcome to try those. You'd need gst-plugin-ducati and libdce.

Also you might need "mm-accel" versions of gstreamer components, which are 
used when "mmip" flag in MACHINE_FEATURES is set...

You would also be better off moving the further discussion to 
meta-arago@arago-project.org mailing list, since this is not BSP specific.

-- 
Denys


On Thu, Sep 25, 2014 at 06:05:14PM +0200, Enrico wrote:
> On Thu, Sep 25, 2014 at 5:57 PM, Manuel Torres
> <manuel.torres.fernandez@gmail.com> wrote:
> > Which console image should I build? The Arago or the Gumstix one?
> 
> The arago one, just to be sure you have a working setup.
> 
> (and btw you shouldn't have the gumstix one, because it's in gumstix-extras).
> 
> Enrico
> 
> 
> > On Thu, Sep 25, 2014 at 5:33 PM, Enrico <ebutera@users.sourceforge.net>
> > wrote:
> >>
> >> On Thu, Sep 25, 2014 at 4:31 PM, Manuel Torres
> >> <manuel.torres.fernandez@gmail.com> wrote:
> >> > First of all, thank you for taking the time to help me.
> >> >
> >> > Now, back on topic: should I download the "meta-arago-extras" layer?
> >> > That is
> >> > what I found on Google when I searched for "gst-plugins-ducati".
> >>
> >> You should just follow the steps to build latest arago, build a simple
> >> console-image and if everything is ok you can go on building gstreamer
> >> and the ducati plugin.
> >> You will need meta-gumstix of course.
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

