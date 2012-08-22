Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8970CE00283
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:35:58 -0700 (PDT)
Received: by eabd1 with SMTP id d1so462855eab.35
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=An+Pf3BjXOKjI4XZjMnY2e4TXzuk1aMcM1XGy1/GThk=;
	b=lUkIN0yHjCokV7XtwliWwaPuPdCC3vKzYiUjONRXVctEEXcNmwCBHXBtDv7A7H7oYP
	wUarXORRFJmECnH0L7z2BpS6z3xpMsZxBs1S9oA/cGOKfDFIlFknMC3upxNQpFmR4K+i
	JpMYBpy5oOYHgvOkxQWUapMbXPyrRNGBfmaeb/hyCHtft5cewJqG6T+Z6BZ5YbTLrrHm
	Pz0OLkhjKT3Bzj63LxiXjpegPp2D3N2XvlY+S0M0d1C4MrKOYIVvaHG0x/1wRqTl4Nnx
	1oBaixBK31nlwGk16r2zuTbwepY/95bqPHUg47cdR5hNdS+V4AAPFUXTbBFD5ihhid8o
	Hj4A==
Received: by 10.14.202.131 with SMTP id d3mr19669017eeo.32.1345656957740; Wed,
	22 Aug 2012 10:35:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 10:35:25 -0700 (PDT)
In-Reply-To: <20120822172038.GE21025@edge>
References: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
	<20120822152450.GA21025@edge>
	<CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
	<20120822172038.GE21025@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 10:35:25 -0700
Message-ID: <CAMKF1sqO4O61XfzJ5m3WaXN027VtbyUmBd=zG3rbyxjo_AyaDg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Replace proto= with protocol= in SRC_URI
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
X-List-Received-Date: Wed, 22 Aug 2012 17:35:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 10:20 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>
> I couldn't find in the history when it was ever pointing to that mirror - are
> you sure you didn't make the change yourself?

could be. I dont have commit history in my tree to remind me and this
clone is from oct 2011
angstrom also changed its hosting location during that time
so anything is possible nevermind I deleted it and cloned fresh

