Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 208EEE0074B
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2012 09:46:38 -0700 (PDT)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7TGkOYp011157;
	Wed, 29 Aug 2012 11:46:24 -0500
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGkOx3006536;
	Wed, 29 Aug 2012 11:46:24 -0500 (CDT)
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:46:24 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGkOfK004258;
	Wed, 29 Aug 2012 11:46:24 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:53 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGjrBb002451;
	Wed, 29 Aug 2012 11:45:53 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:53 -0500
Received: from DFLE73.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGjrtT002445;
	Wed, 29 Aug 2012 11:45:53 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGjq2o002442;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from DFLE73.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGjqDp002414;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from DFLE72.ent.ti.com (dlep26.itg.ti.com [157.170.170.121])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7TGjqug002407;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Aug 2012 11:45:52 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7TGjqbg012246;
	Wed, 29 Aug 2012 11:45:52 -0500
Date: Wed, 29 Aug 2012 12:45:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20120829164541.GG23636@edge>
References: <CALjj03XPWGLXGAeDxJzg8_ap_ai=9=CnQwms5dujL7oNsmBkCw@mail.gmail.com>
	<503D3DFE.3020000@balister.org> <503D3E68.4020007@balister.org>
MIME-Version: 1.0
In-Reply-To: <503D3E68.4020007@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 29 Aug 2012 16:46:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 28, 2012 at 03:55:52PM -0600, Philip Balister wrote:
> One item I am not sure anyone has pointed out is that meta-ti is
> both a BSP and a SOC support layer. So people with OMAP BSP's will
> also want to sue meta-ti to use things like dsplink.

Isn't BSP inclusinve of SoC? :)

Denys


> On 08/28/2012 03:54 PM, Philip Balister wrote:
> >FYI.
> >
> >
> >-------- Original Message --------
> >Subject: Re: [Gumstix-users] Yocto and Wifi for Overo
> >Date: Tue, 28 Aug 2012 17:11:56 -0400
> >From: Sebasti?n Bas Kana <sbaskana@gmail.com>
> >Reply-To: General mailing list for gumstix users.
> ><gumstix-users@lists.sourceforge.net>
> >To: General mailing list for gumstix users.
> ><gumstix-users@lists.sourceforge.net>
> >
> >I used meta-gumstix and had to add meta-ti, but the latter has some issues
> >with licensing checksums and broken dependencies, so I removed the
> >conflicting files and had to build the core-image-minimal, as the "base"
> >one fails to build the root filesystem.
> >
> >To enable WPA Wifi I followed what is explained on this thread:
> >
> >http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/631
> >
> >Is there a cleaner way to do this? Why is meta-ti broken?
> >
> >Thank you for your help!
> >
> >Sebasti?n
> >
> >On Fri, Aug 24, 2012 at 4:48 PM, Andreas M?ller <
> >schnitzeltony@googlemail.com> wrote:
> >
> >>On Fri, Aug 24, 2012 at 5:27 PM, Sebasti?n Bas Kana <sbaskana@gmail.com>
> >>wrote:
> >>> Hi Guys,
> >>>
> >>> Has anyone been able to build a Wifi (WPA) enabled image for the overo
> >>with
> >>> Yocto?
> >>>
> >>> I keep getting errors when I try to configure wlan0. How can I get the
> >>> drivers working?
> >>>
> >>> Thank you in advance!
> >>>
> >>> Sebasti?n
> >>>
> >>with meta-gumstix and networkmanager in image (e.g [1]) I have no
> >>problem to connect my hidden WPA2 network and setup is easy.
> >>
> >>Andreas
> >>
> >>[1]
> >>http://gitorious.org/schnitzeltony-oe-meta/meta-misc/blobs/master/recipes-image/xfce-base-image.bb
> >>
> >>
> >>
> >>------------------------------------------------------------------------------
> >>
> >>Live Security Virtual Conference
> >>Exclusive live event will cover all the ways today's security and
> >>threat landscape has changed and how IT managers can respond. Discussions
> >>will include endpoint security, mobile security and the latest in malware
> >>threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
> >>_______________________________________________
> >>gumstix-users mailing list
> >>gumstix-users@lists.sourceforge.net
> >>https://lists.sourceforge.net/lists/listinfo/gumstix-users
> >>
> >
> >
> >
> >
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> >
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

