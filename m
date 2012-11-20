Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7436AE0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 09:11:42 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAKHBexw018277;
	Tue, 20 Nov 2012 11:11:40 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAKHBeCd018506;
	Tue, 20 Nov 2012 11:11:40 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 20 Nov 2012 11:11:40 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAKHBeBa023505;
	Tue, 20 Nov 2012 11:11:40 -0600
Date: Tue, 20 Nov 2012 12:11:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Belisko Marek <marek.belisko@gmail.com>
Message-ID: <20121120171139.GD26674@edge>
References: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
	<CAOT3miJQ_VscLkeWfdVXY-kMrn4AL=4wyV3yKyrm9wH0aDVFrw@mail.gmail.com>
	<CAAfyv36w+eRju-dA0zd_L9pgLjhaQJjeYjMwMJrXBgC12ajBkg@mail.gmail.com>
	<20121115223921.GA28859@denix.org>
	<CAAfyv37oJbD-DXOoEFY_PDaSYuGHVXBT8-Ft=b4Em1RvbVhNmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfyv37oJbD-DXOoEFY_PDaSYuGHVXBT8-Ft=b4Em1RvbVhNmA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard fails to fetch 3.4 kernel
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
X-List-Received-Date: Tue, 20 Nov 2012 17:11:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 20, 2012 at 12:21:47PM +0100, Belisko Marek wrote:
> On Thu, Nov 15, 2012 at 11:39 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Thu, Nov 15, 2012 at 09:37:43PM +0100, Belisko Marek wrote:
> >> Hi,
> >>
> >> On Thu, Nov 15, 2012 at 9:36 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> >> > On Thu, Nov 15, 2012 at 9:32 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> >> >> ERROR: Function failed: Fetcher failure for URL:
> >> >> 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
> >> >> Unable to fetch URL from any source.
> >> >> ERROR: Logfile of failure stored in:
> >> >> /home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671

^^^^^^^^ can you check this file?


> >> >> ERROR: Task 681
> >> >> (/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
> >> >> do_fetch) failed with exit code '1'
> >> >>
> >> >
> >> > are you behind a corporate firewall?
> >> Nope.
> >> >
> >> > is it reproducible several times? it could be a weakness of our git server...
> >> 100% reproducible
> >
> > Can you do it manually:
> >
> > $ git clone git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git
> > Cloning into 'kernel-ubuntu'...
> > remote: Counting objects: 2881261, done.
> > remote: Compressing objects: 100% (435671/435671), done.
> > remote: Total 2881261 (delta 2417385), reused 2880107 (delta 2416231)
> > Receiving objects: 100% (2881261/2881261), 691.87 MiB | 1.02 MiB/s, done.
> > Resolving deltas: 100% (2417385/2417385), done.
> > Checking out files: 100% (33126/33126), done.
> Why then it's not working in yocto? Any ideas?

