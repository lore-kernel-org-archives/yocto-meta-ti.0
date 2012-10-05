Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF4EBE00292
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 09:38:00 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so2535732vbm.35
	for <meta-ti@yoctoproject.org>; Fri, 05 Oct 2012 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JJHd0PbwtbZKVHMcaP+TNGeIjt6cwvE/bXtWOWOHgOQ=;
	b=EvRVjIGcvxoS1JYT1EboCfrENwqbCvsj/0zVuo0ukEpTv/olMXYizumso86Gdp7TdG
	E0JnqNjFWG9pAizxYn7kltLtvEETiGeqIV1MGWQyLzipzlA7tm0aYuZLvJ59k7NIxHxC
	VDucsp8ejdliaVbgSlWv2o/u8d5vX4lslQ9Z6/3ykWM/TkbFGsQk/qqfgx8XkHc7GBrH
	i+J3rkY55ZPh3QCVIaf3hBgqKnKnjrbr4qqoZm7hSfg8ig+ALEiV9OX78w4YBZqa2pPC
	wqclAn3BXmk6k7noVPGjXWT+nbjGRIg7iHKjYCmc4BMLB3fT7bo6OSHLmu9eYimL2C8c
	47Lg==
Received: by 10.52.36.201 with SMTP id s9mr4394779vdj.101.1349455077773; Fri,
	05 Oct 2012 09:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 5 Oct 2012 09:37:37 -0700 (PDT)
In-Reply-To: <CAMAb8ZMnmyohZ=_KjjJPjOwtNo78GkONLDz7oq+9qk2HZ_FFww@mail.gmail.com>
References: <CAMAb8ZMnmyohZ=_KjjJPjOwtNo78GkONLDz7oq+9qk2HZ_FFww@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 5 Oct 2012 18:37:37 +0200
Message-ID: <CAOT3miJd-8hZYHusTRbqVUVZJabsux49N7PVYckKmwYM1cTuKQ@mail.gmail.com>
To: Evade Flow <evadeflow@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Pandaboard ES boots but display not working
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
X-List-Received-Date: Fri, 05 Oct 2012 16:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 5, 2012 at 6:08 PM, Evade Flow <evadeflow@gmail.com> wrote:
> It boots to a prompt in the serial console, but the display attached to
> the DVI port never comes up.  I see a bunch of these errors fly by in
> the console:

you should try the HDMI port. we've had lots of problems with DVI
until very recently...

we have done a denzil build this week for panda, and it booted fine, with UI.

