Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4DABAE00306
	for <meta-ti@yoctoproject.org>; Mon, 23 Jan 2012 10:45:04 -0800 (PST)
Received: (qmail invoked by alias); 23 Jan 2012 18:44:55 -0000
Received: from p5B0A202F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.32.47]
	by mail.gmx.net (mp068) with SMTP; 23 Jan 2012 19:44:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/bd61c8nPbMwIcqcGTQf0DkmuFfDz04ew/yyj7F4
	03zJ4ELni0B1IT
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 Jan 2012 19:46:48 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<201201231752.12060.schnitzeltony@gmx.de>
	<B6BB4942-0E12-4A95-A52E-10132586B5F2@dominion.thruhere.net>
In-Reply-To: <B6BB4942-0E12-4A95-A52E-10132586B5F2@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201201231946.48960.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 18:45:04 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, January 23, 2012 05:55:07 PM Koen Kooi wrote:
> Right, you need 32 bit libs installed for installjammer to work
> 
> On fedora: yum install glibc.i686
> 
Fixed build here. Thanks! Will run test in the next days.

Ehm - aren't there few tricky lines of code available, informing user of missing 
packets and abort then?

Andreas

