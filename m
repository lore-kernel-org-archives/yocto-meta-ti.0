Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0F0C4E0030F
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 15:01:44 -0800 (PST)
Received: (qmail invoked by alias); 20 Jan 2012 23:01:43 -0000
Received: from p4FDF004E.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.0.78]
	by mail.gmx.net (mp032) with SMTP; 21 Jan 2012 00:01:43 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/PWslCYmPPdgA/CcwTG9qcsUUsj2BhbYe4y+OvZH
	YW9gHWXMnDiLYK
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Sat, 21 Jan 2012 00:03:09 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXkSKimGzpL+-W4JQ5095SiwJx7iukM8y-X8+icZjbPLHw@mail.gmail.com>
In-Reply-To: <CA+M6bXkSKimGzpL+-W4JQ5095SiwJx7iukM8y-X8+icZjbPLHw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201201210003.10081.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] u-boot 2011.12: fix L2 cache on non-omap4 platforms
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
X-List-Received-Date: Fri, 20 Jan 2012 23:01:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, January 20, 2012 04:40:43 PM Tom Rini wrote:
> On Fri, Jan 20, 2012 at 5:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Acked-by: Tom Rini <trini@ti.com>
> 
> And to address Andreas' comment, for now the proper solution is still
> under discussion so an isolated revert is fine here.
I know - but the commit message of original patch said:

| This was breaking the boot for OMAP4 with latest mainline
| kernel. The solution is to disable external caches in
| cleanup_before_linux(). With this fix kernel is booting again.

Just wanted to avoid issues on OMAP4 because my feeling is that discussions on 
this issue will last a while so that this patch will be more than a temporary 
workaround and I do not see what's wrong with some #ifdeffing here.

Andreas

