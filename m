Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66A35E0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 17:29:36 -0800 (PST)
Received: by bkcji17 with SMTP id ji17so5487303bkc.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 17:29:35 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.204.157.145 as permitted sender) client-ip=10.204.157.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.204.157.145 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.204.157.145])
	by 10.204.157.145 with SMTP id b17mr2650704bkx.112.1330997375165
	(num_hops = 1); Mon, 05 Mar 2012 17:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AFC0/MsUejCTXzEAjPiK+6A9RoD+hcAx+Ruj2XLCRFk=;
	b=MJh2SGYaq2+zRRDEThf8QpV8Luetrk8uXBv08QhMy4nwOmj+0SbH0SSFmKJf17orEQ
	05KY7zGCFK/0ofRMyFNlkKUF2DO2u52pmiKDFr7qrcaiYjm9hw74BIFbNknXM4bdJvhe
	E6Zkj2w9ZUiApzAdhPHlHLL5O+FGr+CIdjPtP96WWVJPa3mOd4nwamnqB64Bww/XuANq
	DZhCaOE4iLCqo4ej5M+k48UDfqkhKbBc5pgc+q8k2zCcPCc9yMW6NDueMIimakt21psc
	GjEusCvp6doMK/s/YGKSErzi44jd5hSsRQSkeJe5p2H4h+l5aPTJjQoFU1TKEKzwrtyU
	Bwlg==
MIME-Version: 1.0
Received: by 10.204.157.145 with SMTP id b17mr2033072bkx.112.1330997375066;
	Mon, 05 Mar 2012 17:29:35 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Mon, 5 Mar 2012 17:29:35 -0800 (PST)
In-Reply-To: <20120306005241.GF2030@denix.org>
References: <20120306005241.GF2030@denix.org>
Date: Mon, 5 Mar 2012 20:29:35 -0500
Message-ID: <CAFZh4h9Xv8UKxcPe-N-Wa+yqi_qd504nx2fpAhXE5ZawFgUrMQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Fw: OpenEmbbedded as a test suite next steps
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
X-List-Received-Date: Tue, 06 Mar 2012 01:29:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 5, 2012 at 7:52 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> We're starting with GCC and need a kernel to supply headers and to
> boot some type of ARMv7 image.

I have 3 different ARMv7 platforms I can use to test against if needed :)

Regards,

Brian

