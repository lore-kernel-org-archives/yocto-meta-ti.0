Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 899B6E0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 12:43:28 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:44538)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BC67> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Sat, 10 Aug 2013 21:42:52 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Sat, 10 Aug 2013 22:42:14 +0200
Message-ID: <1540891.M2cSCALLnL@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
In-Reply-To: <20130810175429.GF27433@edge>
References: <1554710.Rp68v4FIpQ@kgy-pc> <20130810173820.GC27433@edge>
	<20130810175429.GF27433@edge>
MIME-Version: 1.0
Subject: Re: Problem compiling libgles-omap3_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 19:43:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> > You need to disable that specific QA check in your distro or local.conf to
> > get through. Unfortunately, most of the libraries in libgles are
> > proprietary and shipped in binary form that are already stripped, so this
> > QA check will always complain, but needs to be non fatal...
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/p
> oky.conf#n102

Thanks a lot, it works now!


