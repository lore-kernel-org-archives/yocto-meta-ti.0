Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CD77E01351
	for <meta-ti@yoctoproject.org>; Thu, 26 Jul 2012 06:28:55 -0700 (PDT)
Received: by vbjk17 with SMTP id k17so1930261vbj.35
	for <meta-ti@yoctoproject.org>; Thu, 26 Jul 2012 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ewnYgNXPHrVaS0aOrseD2owsiSnhgI0oTs8a3vE4Q3k=;
	b=YjIV88QelJrzAwnQF53SYfcV8G7e/MldV4c/CaVBa9FDHrUglTPG4CpwxiAjeRWzhe
	Up2y0RxpWS1ocV7EWU+cdN64X8TQ9cUxE6LquDApSf8oqv+Cvlkug+fNdf9v2OQuZjMq
	NGvbsJV1g1dlSIIce/O8xXIMUJippSpp+jdS6ZOwVQgjo+FOAAyj+gkbhqkxXjZKD5Tg
	SdjaUNAuYuV/VVKVQezQ8qJVdvXc9LAZ7XwqLv6cDzYp87dXEnICYS5sOiiXv0a9MXnB
	FMGGnWIH8GfJrWHsH8FeKAsenMZyQUNAr3HainW6gcIEqUxiU1auANrYH0IDIfxHQMve
	zM8Q==
MIME-Version: 1.0
Received: by 10.221.12.81 with SMTP id ph17mr21570456vcb.47.1343309334606;
	Thu, 26 Jul 2012 06:28:54 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.32.141 with HTTP; Thu, 26 Jul 2012 06:28:54 -0700 (PDT)
In-Reply-To: <1343243776.71726.YahooMailNeo@web121603.mail.ne1.yahoo.com>
References: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
	<20120725051154.GC28778@edge>
	<1343243776.71726.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Date: Thu, 26 Jul 2012 15:28:54 +0200
X-Google-Sender-Auth: gRta8piZU8XH9PmmhSHdwRjMFsM
Message-ID: <CA+2YH7uDvJr9i015e32tMa+y0Z+KM5JATC8NM9ChOJ++mrei6A@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: maniacbug <maniacbug@ymail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omapfbplay depends on libav
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
X-List-Received-Date: Thu, 26 Jul 2012 13:28:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 25, 2012 at 9:16 PM, maniacbug <maniacbug@ymail.com> wrote:
> Using Yocto, gstreamer does install gst-launch, but I do not currently possess the knowledge to "build a gstreamer pipeline", AND gst-launch is "primarily a debugging tool, you should not build applications on top of it."
>
> I'm looking for something which I can just exec and go, "<toolname> <mediafile>.m4v"

gst-launch playbin2 uri=file:///<mediafile>.m4v

or

ffplay <mediafile>.m4v

Enrico

