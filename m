Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B1A9E01642
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 17:32:17 -0700 (PDT)
Received: by mail-ea0-f181.google.com with SMTP id d10so2075974eaj.26
	for <meta-ti@yoctoproject.org>; Fri, 04 Oct 2013 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fW0fYhWxEwBSadBXJj7TuVZvQAVT5b6bLOxd/CPNLng=;
	b=QTA0ExpMlr8ultkdgxYJEJFimOKBVgKRoEdw0ujj4R/0p9lxsHcgvDnx5bophiH3Gs
	9bV+mPn5WzZhiZYjXzYdXX5ZAojvF5ih+JhejWo3xQyT+Ok2kgO/9EIWtbB613ni62kV
	UAr50yiQ7gbl9Fur3SfQja8BsAl7oEgvHInAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fW0fYhWxEwBSadBXJj7TuVZvQAVT5b6bLOxd/CPNLng=;
	b=Myfbo59RrCLN/PcvNkUD+1G+3oAz7USiRRchDsJG69IQ0tudlRPe/hYWj0EZIzK92b
	FOOAHE0HgIJf/S7uaI+8Po21Q28jVX2h1acppftAEX/O1MDoFWQJEkLAluo2PaSRKKOv
	DzdzVPJEzVx0C7FSPlD+OUUJgKLwLfeJt5bhfbQdO1n0BQIIH3ytnCE4lvm5qkAxYZvC
	kH/eT8DAdPgbeGquiZCkC3UXbG0OD4mZDiR346yg3+BhI+LrtkSO62L0GyizgBX9AfOb
	CfyumdeC//bB0Ssy0Gyam8qCaeBUO40OCg7PMziguut3L27by1g1mrdS2fa9ROma4RFv
	X+MA==
X-Gm-Message-State: ALoCoQnoAAJJoCiMHXbgfUxm0aXMjfYIRhH2sUOfmWflDePaNd53aUdwqZOPaeZ/FcuY8bqUg7M4
MIME-Version: 1.0
X-Received: by 10.14.214.136 with SMTP id c8mr25695395eep.6.1380933136238;
	Fri, 04 Oct 2013 17:32:16 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Fri, 4 Oct 2013 17:32:16 -0700 (PDT)
In-Reply-To: <20131004215047.GD3672@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
	<20131004182321.GA3672@edge>
	<CA+gsK-ofzwiKXqVCQ-=_kcvZJu+aaWqa07-DgVYTh91VB70OvQ@mail.gmail.com>
	<20131004215047.GD3672@edge>
Date: Fri, 4 Oct 2013 17:32:16 -0700
Message-ID: <CA+gsK-rqwXrV1WjWx0pttqpxMkkM29cBwYMHvEaXdDDVcuW0tw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Sat, 05 Oct 2013 00:32:18 -0000
Content-Type: multipart/alternative; boundary=047d7b6243200b6b7a04e7f38d85

--047d7b6243200b6b7a04e7f38d85
Content-Type: text/plain; charset=ISO-8859-1

Thanks, Denys. That did the trick.

Rudi

--047d7b6243200b6b7a04e7f38d85
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Thanks, Denys. That did the trick.<div><br></div><div>Rudi</div><div class="gmail_extra"><br><br>
</div></div>

--047d7b6243200b6b7a04e7f38d85--
