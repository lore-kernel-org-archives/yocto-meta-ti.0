Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D80F4E01402
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 05:12:19 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so3166108bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 05:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=rOwWfu1OwxLLKmbKwcyx24TRdc2MwHKEnIlnnaIJfjU=;
	b=iPealjn6kbiMgtDu/N6PGE/113+gRw5f1hpevONagwUfmKyKfU4tqFJjmxFs2lnstV
	A3ZAs+EfOE8cDpd/HxYBXxJkS8pac2hKjQbOZhMVjIw6vj8YMDUwjkOTe2rRwMGgd3uM
	E0lHwkgi1+5zy1kuWzKkJkt23vb4eacRe4omQSKj8BphGiwnjpWTcJ80062gBoGM7mxY
	71OOx9ljEdOjNqQH4SZxidAZWmabBzSbR9U6LNjr6f/slr2vkWqnaDo10h/WQXDTyYhC
	hXIcYQPYIgGW1pmFW8ZKZlXxee00kuI0AtGqzrT+VPUwqedbiBvNri8M2VChg10VrOFk
	vNFw==
Received: by 10.205.133.7 with SMTP id hw7mr4785675bkc.123.1336738338362;
	Fri, 11 May 2012 05:12:18 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id gm18sm18180137bkc.7.2012.05.11.05.12.15
	(version=SSLv3 cipher=OTHER); Fri, 11 May 2012 05:12:17 -0700 (PDT)
Message-ID: <4FAD021E.3070105@dresearch-fe.de>
Date: Fri, 11 May 2012 14:12:14 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: Cliff Brake <cliff.brake@gmail.com>
References: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
	<20120511044725.GC26492@denix.org>
	<CAOd_LFwCH3aCuNsUnX1JHWEyNKVREqdoNAiBZrWLWmevqNsHeQ@mail.gmail.com>
In-Reply-To: <CAOd_LFwCH3aCuNsUnX1JHWEyNKVREqdoNAiBZrWLWmevqNsHeQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
X-Gm-Message-State: ALoCoQkFBdqXnYpPW2INWW2ev6JeXbEDAwNgemMwkYZNoLbCnfcVXmBFq9jUoHBOcHOcn3blBtq8
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: add directory prefix to patch URIs
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
X-List-Received-Date: Fri, 11 May 2012 12:12:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.05.2012 13:10, Cliff Brake wrote:
> Denys,
> 
> Thanks for the clarification -- I made the mistake of thinking the
> meta-ti master was on Github (saw it there when Angstrom moved).
> 
> https://github.com/Angstrom-distribution/meta-ti
> 
> I notice now at the top of the above page, it says it is a mirror, but
> it may be a good idea to mention in the README where the master repo
> is to avoid confusion.

I hit the same confusion and mentioned it in thread <https://lists.yoctoproject.org/pipermail/meta-ti/2012-April/000975.html>.

Unfortunately there was no final clarification by the meta-ti maintainers until now, just a short "And you're thinking wrong". :(

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

