Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A24A3E01426
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 16:02:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M5Z00HKRPBSB75C@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 21 Jun 2012 18:02:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 545AF20564; Thu,
	21 Jun 2012 19:02:16 -0400 (EDT)
Date: Thu, 21 Jun 2012 19:02:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20120621230216.GD30753@denix.org>
References: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: massive fallout after updates / was (no subject)
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
X-List-Received-Date: Thu, 21 Jun 2012 23:02:55 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Fri, Jun 22, 2012 at 12:11:46AM +0200, Andreas Müller wrote:
> On Thu, Jun 21, 2012 at 11:36 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
> > after updating all my repos (angstrom+few extra layers) I get
> 
> The error seems to be caused by meta-ti. When removed, parsing works
> as expected. By re-including I get now:
> 
> ERROR: ExpansionError during parsing
> /home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb:
> Failure expanding variable FILESPATH, expression was
> ${@base_set_filespath([
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti-svnr962-r85+${MACHINE_KERNEL_PR}",

Could be caused by MACHINE_KERNEL_PR being undefined... What machine you are 
building for?

-- 
Denys


> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti-svnr962",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti-svnr962",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/gstreamer-ti",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti/files",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-ti"
> ], d)} which triggered exception SyntaxError: EOL while scanning
> string literal (FILESPATH, line 1)
> ERROR: No recipes available for:
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   ......
> 
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

