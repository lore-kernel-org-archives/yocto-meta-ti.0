Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC11BE0071D
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2013 13:50:19 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIF00AVMRBHR312@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Feb 2013 15:50:05 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 089D020085; Mon,
	18 Feb 2013 16:50:04 -0500 (EST)
Date: Mon, 18 Feb 2013 16:50:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nick G <exosyst+metaTI@gmail.com>
Message-id: <20130218215004.GE6546@denix.org>
References: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
	<CAOT3miKb1nEMwp03OGnyDV31O5NAWvZKiZSj7piyVJf-jQhLEg@mail.gmail.com>
	<CAN-pQATiMWdQd_t91-8ZDVX2HUwdeoFAUfAgVfMZXB2niVB16Q@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAN-pQATiMWdQd_t91-8ZDVX2HUwdeoFAUfAgVfMZXB2niVB16Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Jesse Dannenbring <jtdannenbring@gmail.com>
Subject: Re: Error building after "mesa-dri update to 9.0.1"
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
X-List-Received-Date: Mon, 18 Feb 2013 21:50:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 18, 2013 at 09:36:50PM +0000, Nick G wrote:
> Hey guys,
> 
> I'm having this same issue and I've checked out poky and meta-ti from Git
> this evening so nothing to do with Danny.
> Is this not the preferred method? I'm struggling to find good step-by-step
> resources for getting going on a build for my beaglebone.

Well, oe-core recently got updated to 9.0.2 already, I just pushed the fix to 
meta-ti to sync it up.

-- 
Denys


> On 11 February 2013 19:58, Nicolas Dechesne <ndec13@gmail.com> wrote:
> 
> > On Fri, Jan 25, 2013 at 11:51 PM, Jesse Dannenbring
> > <jtdannenbring@gmail.com> wrote:
> > > I previously was building meta-ti without issue but I repeated the
> > process
> > > recently and found that the patch on 2013-01-10 broke my build:
> > >
> > > bitbake -c fetchall core-image-minimal
> > > Pseudo is not present but is required, building this first before the
> > main
> > > build
> > > Parsing recipes: 100% |#########################################| Time:
> > > 00:02:54
> > > Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets,
> > 64
> > > skipped, 7 masked, 0 errors.
> > > ERROR: No recipes available for:
> > >
> > >
> > /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
> > > ERROR: Command execution failed: Exited with 1
> >
> > you are probably using meta-ti/master with poky/danny branch, which is
> > not expected to work. if you want to use danny, then use 'danny'
> > branch from meta-ti too.
> >
> > nicolas
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


