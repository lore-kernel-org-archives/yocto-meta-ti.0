Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52E41E0074B
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 10:00:05 -0700 (PDT)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TGxVVU020627;
	Wed, 29 Aug 2012 11:59:31 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGxVLo014495;
	Wed, 29 Aug 2012 11:59:31 -0500 (CDT)
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:59:30 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGxTG2029749;
	Wed, 29 Aug 2012 11:59:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:59:11 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7TGxBL1002088;
	Wed, 29 Aug 2012 11:59:11 -0500
Date: Wed, 29 Aug 2012 12:59:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20120829165904.GH23636@edge>
References: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
	<503D3DFE.3020000@balister.org>
MIME-Version: 1.0
In-Reply-To: <503D3DFE.3020000@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Sebasti?n Bas Kana <sbaskana@gmail.com>,
	gumstix-users@lists.sourceforge.net
Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
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
X-List-Received-Date: Wed, 29 Aug 2012 17:00:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 28, 2012 at 03:54:06PM -0600, Philip Balister wrote:
> FYI.
> 
> 
> I used meta-gumstix and had to add meta-ti, but the latter has some issues
> with licensing checksums and broken dependencies, so I removed the

"Issues with licensing checksums and broken dependencies" means not following 
instructions in the README file, which clearly says if you don't use meta-oe, 
you need BBMASK.

BTW, it used to work and not complain about missing license even w/o BBMASK 
until some time recently, when a more stricter QA check was added to 
oe-core/bitbake. We've discussed it on #yocto some time ago and I have a small 
workaround for that pending...


> conflicting files and had to build the core-image-minimal, as the "base"
> one fails to build the root filesystem.
> 
> To enable WPA Wifi I followed what is explained on this thread:
> 
> http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/631
> 
> Is there a cleaner way to do this? Why is meta-ti broken?

Again, read the README file carefully, which is supplied with meta-ti, as 
well as all the other layers.

-- 
Denys


> Thank you for your help!
> 
> Sebasti?n
> 
> On Fri, Aug 24, 2012 at 4:48 PM, Andreas M?ller <
> schnitzeltony@googlemail.com> wrote:
> 
> >On Fri, Aug 24, 2012 at 5:27 PM, Sebasti?n Bas Kana <sbaskana@gmail.com>
> >wrote:
> >> Hi Guys,
> >>
> >> Has anyone been able to build a Wifi (WPA) enabled image for the overo
> >with
> >> Yocto?
> >>
> >> I keep getting errors when I try to configure wlan0. How can I get the
> >> drivers working?
> >>
> >> Thank you in advance!
> >>
> >> Sebasti?n
> >>
> >with meta-gumstix and networkmanager in image (e.g [1]) I have no
> >problem to connect my hidden WPA2 network and setup is easy.
> >
> >Andreas
> >
> >[1]
> >http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb
> >
> >
> >------------------------------------------------------------------------------
> >Live Security Virtual Conference
> >Exclusive live event will cover all the ways today's security and
> >threat landscape has changed and how IT managers can respond. Discussions
> >will include endpoint security, mobile security and the latest in malware
> >threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
> >_______________________________________________
> >gumstix-users mailing list
> >gumstix-users@lists.sourceforge.net
> >https://lists.sourceforge.net/lists/listinfo/gumstix-users
> >
> 
> 
> 

> ------------------------------------------------------------------------------
> Live Security Virtual Conference
> Exclusive live event will cover all the ways today's security and 
> threat landscape has changed and how IT managers can respond. Discussions 
> will include endpoint security, mobile security and the latest in malware 
> threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/

> _______________________________________________
> gumstix-users mailing list
> gumstix-users@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/gumstix-users
> 

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


