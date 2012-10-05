Return-Path: <evadeflow@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A0C0E00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 12:06:33 -0700 (PDT)
Received: by mail-oa0-f48.google.com with SMTP id h2so2647428oag.35
	for <meta-ti@yoctoproject.org>; Fri, 05 Oct 2012 12:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eNK0nNhz+v9SqJyG2ny9p7Z9T/OHOeQi4heRt3bU3Js=;
	b=JXUHKfKVuPTiE/eKWf+L+8sJzanIU3T/llcnnc+ITeuYvaApwXgWRYRpTpTz09jXlm
	50bNaAiv4D2WBsIffj/BQCaCdKI/cn88hS1v6b516UE6kqXFmzmnVeBtz154Z1//3tHU
	gYgLL42GDT8vZL1/fK+IHh8qwx/FI4mbgScKj079m6Z10pK2NcTvHZqN9htU2PrM/sGF
	q1lpa+17isCQn/C2US/WHlsgUQIsfJ6RQryPcFPaSP2M1Uz8EhgHnTNHgDC4G3jmRMPL
	Ca8V7LplpuN3b2oXAzk77ejJSz3r37NDVJWGFuqhKNlTIw5MmlCVV+86iBfexqAX8OIZ
	+WIw==
MIME-Version: 1.0
Received: by 10.60.26.133 with SMTP id l5mr8022850oeg.60.1349463993613; Fri,
	05 Oct 2012 12:06:33 -0700 (PDT)
Received: by 10.76.167.165 with HTTP; Fri, 5 Oct 2012 12:06:33 -0700 (PDT)
In-Reply-To: <CAOT3miJd-8hZYHusTRbqVUVZJabsux49N7PVYckKmwYM1cTuKQ@mail.gmail.com>
References: <CAMAb8ZMnmyohZ=_KjjJPjOwtNo78GkONLDz7oq+9qk2HZ_FFww@mail.gmail.com>
	<CAOT3miJd-8hZYHusTRbqVUVZJabsux49N7PVYckKmwYM1cTuKQ@mail.gmail.com>
Date: Fri, 5 Oct 2012 15:06:33 -0400
Message-ID: <CAMAb8ZOh3zM4Dv5RbWMAVqX1NK-BHbGY9CAzROOXLQr9E7zKVg@mail.gmail.com>
From: Evade Flow <evadeflow@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
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
X-List-Received-Date: Fri, 05 Oct 2012 19:06:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

>> It boots to a prompt in the serial console, but the display attached to
>> the DVI port never comes up.  I see a bunch of these errors fly by in
>> the console:
>
> you should try the HDMI port. we've had lots of problems with DVI
> until very recently...
>
> we have done a denzil build this week for panda, and it booted fine, with UI.

I just switched to the other connector and now it works fine. Thanks!

