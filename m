Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E26DE00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 12:09:12 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2907533vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 05 Oct 2012 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=cuDPb2btjn51G/7VIIi4tVGmWqTEzhnz2421gqVW5tA=;
	b=MhRRT93HEfXkLpdaLdSNUCcomeQwKuScRc4umffG3GwLUzW3MFfuKgGYrqZ+8HVAN9
	f5Q5WEloUBBwdgO9j0FZHcPMMu8lOg2BgrqXfxlVZv37xU9tnbhzDx54oOqpVnPIjuxT
	9sA8xs0J++IbUjjlI71OXiBHiWO+64NMKhUPyVCFVhOH6Sslr3wiDfVwYBZqEh14+iTm
	YjQMHafrJOHmZb74Ni+JqQDE5wzvnG9RiJ54Mbw8LNefyO8t4QXkwleU39xzr2F3bzeX
	cUz+yQ5Es3J7ynIn+gduslD+U3Z6Otx0FedxLpU/LOuXWpJLUMmHkyc0mN1WvhTQwTmZ
	/Ulg==
MIME-Version: 1.0
Received: by 10.52.66.36 with SMTP id c4mr4662422vdt.6.1349464149175; Fri, 05
	Oct 2012 12:09:09 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Fri, 5 Oct 2012 12:09:09 -0700 (PDT)
In-Reply-To: <506F2E82.8060906@mlbassoc.com>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
	<506F2E82.8060906@mlbassoc.com>
Date: Fri, 5 Oct 2012 21:09:09 +0200
X-Google-Sender-Auth: iK77xFSy59G5WWHm6NgI5wO6yYI
Message-ID: <CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 19:09:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 5, 2012 at 9:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
>>
>> * Port wl12xx-firmware recipe from arago. This recipe was originally
>>    named linux-firmware in arago.
>> * Wl12xx-firmware provides the firmware files for use with the TI
>>    Wi-Fi + Bluetooth module.
>>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>
>
> Why not just keep the main linux-firmware recipe up to date instead of
> duplicate
> functionality?


I made myself the same question at first, but the answer was there:


>> +# This recipe provides the latest firmware files for wl12xx.
>> +# Therefore, use the contents of this recipe instead of the contents
>> +# of linux-firmware-wl12xx.

>> +SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"


Well one could ask why they are there and not in linux-firmware git
(not polemic, just curious).

Enrico

