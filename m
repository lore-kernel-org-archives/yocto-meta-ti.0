Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97D86E013D4
	for <meta-ti@yoctoproject.org>; Tue, 17 Jul 2012 05:21:52 -0700 (PDT)
Received: by vcbfl11 with SMTP id fl11so226832vcb.35
	for <meta-ti@yoctoproject.org>; Tue, 17 Jul 2012 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=dfFDciu2vUmKK9kl3+sK59rhnDbToXrjzmDxAWGlu7k=;
	b=hUmnXWtm+q9O0z1W3VOo0ZStJazB5QSxm43AwGh/3KWhgNfwB7NGrkje9peUWduRfi
	pvfkDmHvFJ+uKAGhmFND6ykUvOSP5G2wI75ymrKUnYRFvcDzZF0OwqqWbdp0mrYdJuWt
	30y0LOe7Z30ZRevwGGr1Pm62zkyhRQzjtUHvkOj0HvuXQT+CJNC/gK0RzF5nSE6qICu5
	UmLdFyUhz9LGi0Ow0/JZ0o0gQwr8T3LlURK4gOiQvdlujQj1DCKvOmwseBipi0DtyeI5
	MCpHbTNdDzbRbH3vmzLq1g0AqyeHwEU+HdI1pLcAKpw80pn1LR6SsRQH1bkUGhP/9l3u
	OsEw==
MIME-Version: 1.0
Received: by 10.52.69.42 with SMTP id b10mr939596vdu.26.1342527711789; Tue, 17
	Jul 2012 05:21:51 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.166.84 with HTTP; Tue, 17 Jul 2012 05:21:51 -0700 (PDT)
In-Reply-To: <loom.20120716T130331-111@post.gmane.org>
References: <CA+2YH7srjOf900PBFzxVx8Tm4HKaxuvKzKudoo201Bh7-48o6g@mail.gmail.com>
	<loom.20120716T130331-111@post.gmane.org>
Date: Tue, 17 Jul 2012 14:21:51 +0200
X-Google-Sender-Auth: NEK4YT_giAG50kmmbm4ZzYHFsUE
Message-ID: <CA+2YH7uKA7qK7F-Qke-VNws5hFku_Z=z0bSfN8aHLLg3=b+Djg@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: bincy <bincy_k_philip@yahoo.co.in>
Cc: meta-ti@yoctoproject.org
Subject: Re: ti-dsplink build error
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
X-List-Received-Date: Tue, 17 Jul 2012 12:21:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 1:05 PM, bincy <bincy_k_philip@yahoo.co.in> wrote:
> Hi ,
>
> I am also facing the same issue...
> Did u solve this issue.?

The workaround is to add

INHIBIT_PACKAGE_STRIP = "1"

in the dsplink recipe, i don't know if it's the right way to fix it.

Enrico

