Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35F3AE016A3
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2013 12:42:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r98JgIDM003307;
	Tue, 8 Oct 2013 14:42:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r98JgIfR031952;
	Tue, 8 Oct 2013 14:42:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 8 Oct 2013 14:42:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r98JgHvb021079;
	Tue, 8 Oct 2013 14:42:17 -0500
Date: Tue, 8 Oct 2013 15:42:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: =?iso-8859-1?Q?Jo=E3o?= Henrique Freitas <joaohf@gmail.com>
Message-ID: <20131008194216.GA12722@edge>
References: <CANFVK7-d1f6e=cdjTAUjKm0EWws_QybYroAmgwfkXZsccBgYyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANFVK7-d1f6e=cdjTAUjKm0EWws_QybYroAmgwfkXZsccBgYyQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: (No subject)
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
X-List-Received-Date: Tue, 08 Oct 2013 19:42:22 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 08, 2013 at 11:19:33AM -0300, João Henrique Freitas wrote:
> Hello,
> 
> I am new to TI boards.
> 
> Could I use meta-ti (master) and yocto (1.5, dora) ? Any issue combining
> these two versions?

Since dora release is not out yet, I haven't branched off meta-ti yet. So, 
meta-ti/master should still work with oe-core/dora for now. 


> My target platform is am3517-evm.

The only problem I could see is that am3517-evm is an old platform that uses 
2.6.37 kernel and may not be fully compatible with modern user-space. There 
were some syscall requirements in latest udev/systemd that are not compatible 
with that old kernel...

-- 
Denys

