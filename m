Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0755E0027C
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 12:07:59 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU00F8NFWPFD18@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 14:07:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BDDC220092; Tue,
	26 Feb 2013 15:07:37 -0500 (EST)
Date: Tue, 26 Feb 2013 15:07:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-id: <20130226200737.GO6725@denix.org>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com> <512D12D0.7090804@ti.com>
	<20130226200249.GM6725@denix.org>
MIME-version: 1.0
In-reply-to: <20130226200249.GM6725@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org, ceh@ti.com
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 20:07:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 26, 2013 at 03:02:49PM -0500, Denys Dmytriyenko wrote:
> Actually adding Cyril this time.

Ah, never mind - Cyril was already copied, but mailman filters out emails that 
are not subscribed...

> On Tue, Feb 26, 2013 at 02:53:52PM -0500, Murali Karicheri wrote:
> > + Cyril,
> > 
> > Cyril had worked on adding GPH format for u-boot. Want to hear from
> > him why not used the u-boot-with-spl.bin build target.
> > 
> > Murali
> > On 2/26/2013 2:31 PM, Tom Rini wrote:
> > >On 02/26/2013 02:20 PM, Denys Dmytriyenko wrote:
> > >>On Tue, Feb 26, 2013 at 01:42:31PM -0500, Murali Karicheri wrote:
> > >>>Denys,
> > >>>
> > >>>I understand that this recipe is  not complete as u-boot_2013.01.bb
> > >>>may be shared by other machines and this change is not applicable.
> > >>>Do I need to add this to some other file? Please advise.
> > >>>
> > >>>Meanwhile for the release this should work as this is going into
> > >>>mcsdk meta-ti repo. But to push this to meta-ti, the above change is
> > >>>needed and hence need your input.
> > >>Murali,
> > >>
> > >>I know Carlos has been working on adding SPL support to u-boot already:
> > >>
> > >>http://arago-project.org/pipermail/meta-arago/2013-February/000937.html
> > >>
> > >>Can you sync up with him and come up with a unified solution for both SPL and
> > >>GPH images that works for everybody and I'd be happy to push it to meta-ti.
> > >>
> > >>Also, I'd like to hear Tom's opinion on this, as current U-Boot maintainer -
> > >>if there is a better approach to this exists or planned in mainline.
> > >I haven't seen the keystone patches yet, so I don't know if the GPH
> > >image is "special" in terms of headers, but the build target
> > >u-boot-with-spl.bin is the canonical build target for "put
> > >u-boot-spl.bin and u-boot.bin together".
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

