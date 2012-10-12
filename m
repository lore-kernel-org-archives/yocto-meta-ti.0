Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3619AE0027E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:30:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBS0068VOUSOI10@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 12 Oct 2012 14:30:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BF9EC200DD; Fri,
	12 Oct 2012 15:30:28 -0400 (EDT)
Date: Fri, 12 Oct 2012 15:30:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-id: <20121012193028.GC32601@denix.org>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
	<CAOT3miJo3tMK8nAc0x3o=cFBOuoMrUjvSYR61LbH9oGDsa2fvg@mail.gmail.com>
	<CA+2YH7unzpCXz9+V2WZUEZeE-9r_yaft220BRyXkSc9eNesRCw@mail.gmail.com>
	<CAOT3miLA-+gXGNTtL2iJAtvs61b_jWreaVBTTyTa-BRGDiviXA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOT3miLA-+gXGNTtL2iJAtvs61b_jWreaVBTTyTa-BRGDiviXA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Fri, 12 Oct 2012 19:30:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 11, 2012 at 02:17:47PM +0200, Nicolas Dechesne wrote:
> On Thu, Oct 11, 2012 at 12:53 PM, Enrico <ebutera@users.berlios.de> wrote:
> >>> +RDEPENDS = "libdrm ti-firmware-ipu-dce"
> >>
> >> i would hope that libdrm is not needed in RDEPENDS, as it should be
> >> handled automagically by shlibdeps.
> >
> > I really don't know, if you are sure about that i will just remove it.
> 
> well, i am slowly re-learning oe stuff as i have been out of if for a
> couple of years...

Hey, Nicolas, were you working with Mike Turquette back than on the Poky 
integration for TI/WBU parts? I remember talking to him on few occasions, 
as I was working on OpenEmbedded and Arago, trying to convince him to join 
forces and align on OE, since Poky went on hiatus around that time... :)

-- 
Denys

