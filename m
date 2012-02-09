Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF8C4E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:54:38 -0800 (PST)
Received: by bkcjm1 with SMTP id jm1so2189517bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YTGQ5XdUfqlWfz9AYdl91oaGYe99PJneFNeoRK6dJqY=;
	b=oxbJ4YShCBeO9czcx1InfLOSZdPAt+stxcZHq8CkAuDCuyJO8AycuaXXA2Un2rro6D
	12AtfANN1QtQvF9BwSxe1kz8X3UvlxUKOV62vB+8krlS1u0uiWzXNe3XIkck9RBdiAmQ
	03h7/ol4D1AU6031TWMElXr6dyJYue1B8QJo4=
MIME-Version: 1.0
Received: by 10.205.131.13 with SMTP id ho13mr1104394bkc.58.1328806477627;
	Thu, 09 Feb 2012 08:54:37 -0800 (PST)
Received: by 10.205.141.203 with HTTP; Thu, 9 Feb 2012 08:54:37 -0800 (PST)
In-Reply-To: <20120209163651.GA3917@denix.org>
References: <4F32F1B3.8090000@mlbassoc.com> <4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<4F331E78.3000302@ti.com>
	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>
	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
	<20120209163651.GA3917@denix.org>
Date: Thu, 9 Feb 2012 11:54:37 -0500
Message-ID: <CAFZh4h_-E=o5eeaoz09-XGg7d+O=9+B0KXcqvqtsVB8_GustuQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 16:54:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 11:36 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> Arago/meta-arago is still going to be the official platform distribution for
> TI SDK products. But, a separate meta-ti layer was created early in the
> process to detach and unify the BSP layer and allow people to use TI hardware
> with different distributions. And that's actually part of the problem, as
> distributions like religions conflict with each other in a single layer... :)

Hey Denys, good to hear from you again!

Sorry for totally hi-jacking this thread .... so what should be the
roadmap for someone like me who works on TI products and has to
generate images now?  Do I use Yocto with meta-ti and in the future
when the dust settles use Yocto with meta-arago?

I've heard bits and pieces of things changing but I guess I never knew
enough of the TI roadmap to know for sure what I should be doing so
that I steer our team/company in the right direction for all these
changes.  I'm currently using Arago to generate our images (separate
CSL toolchain (old), and the generated packages are old too).

Regards,

Brian

