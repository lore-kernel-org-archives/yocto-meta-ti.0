Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64728E01214
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 02:23:55 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so508469vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=fu+FBTnu/kstvt5o6qG+2U1y6wAp7L1Rp8ZY0OzMosk=;
	b=i9CXO6nRiV1iGVJf0KseT4tWzjE0ji0+Zlog1vrfxtt+QKsvEY906qKO6gvZmU6gtC
	+l6SZomuGiDYoq0ohTuhLRKI933ax8RXNZ6cIqw4xdj2eKj9fl31QR++l3It4mAgncn5
	5uL1sq6J/dVA9IOUekJUd9+0TcsRgzlcqPok0pzyLcJnB00N2cOuBKTDT74ZiF//VSzk
	kAgpElrD3vjpc4eb2ur/0FkHO7I9weqZjKrio6/5bjiynkdSAodx3N7gelJuhMhHeawa
	v+3yOOranWg9bCFMiY/xuygeH/ESTJzR8EssAB+oexU7PQS8k0cto5QbweB/+CEevwO+
	Bsgg==
MIME-Version: 1.0
Received: by 10.52.33.130 with SMTP id r2mr10686085vdi.43.1349861020501; Wed,
	10 Oct 2012 02:23:40 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Wed, 10 Oct 2012 02:23:40 -0700 (PDT)
Date: Wed, 10 Oct 2012 11:23:40 +0200
X-Google-Sender-Auth: WjYYmaBjaqNWzSel8drP4PpQJiQ
Message-ID: <CA+2YH7t+V==z2+Amb=GOeLneT-ZrxtmS10RJBEwn4gLSndOv_w@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: meta-ti@yoctoproject.org
Cc: rob@ti.com
Subject: gst-ducati...again
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
X-List-Received-Date: Wed, 10 Oct 2012 09:23:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

i have a working setup, tested on angstrom master (downloaded ~ a week
ago) console-only, with gst-ducati h264/mpeg4 encoding working. I
tested it with videotestsrc (1080p 30fps) and a 1080p webcam (2 fps)
too with default settings.

I've used the prebuilt ipu firmware from [1] but i noticed that
sometimes older files can get deleted from there. Before sending
recipes for review, do someone know if those firmware files can be
mirrored somewhere or is it a license violation?

Enrico

[1]: https://launchpad.net/~tiomap-dev

