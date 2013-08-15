Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE17FE013EC
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2013 23:54:39 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:46555)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BFE7> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Thu, 15 Aug 2013 08:54:02 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Thu, 15 Aug 2013 09:53:30 +0200
Message-ID: <19123784.q32VqNnUcT@kgy-pc>
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
X-List-Received-Date: Thu, 15 Aug 2013 06:54:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

> Here's a pointer:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/d=
istro/p
> oky.conf#n102
> # QA check settings - a little stricter than the OE-Core defaults
> And "already-stripped" should be in WARN_QA instead of ERROR_QA.
Just a question: How can i set it locally? Is it necessary to modify po=
ky.conf=20
itself? Putting it to local.conf seems not enough.

Regards
Gy=F6rgy K=F6vesdi

